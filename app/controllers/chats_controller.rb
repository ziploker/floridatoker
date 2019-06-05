class ChatsController < ApplicationController
	require 'opentok'
	skip_before_action :verify_authenticity_token
	  
	
	
	$session



	def demo

		@api_key = ENV['api_key']
	    api_secret = ENV['api_secret']
		    
		    
	    opentok = OpenTok::OpenTok.new @api_key, api_secret
	    
	    @allChats = Chat.all

	    numbr = rand(400..5000)
    	@ipAddress = request.remote_ip
    	puts "IP address is = "+ @ipAddress
    
    
	    
	    #if no rooms exists at the moment
	    if @allChats.length == 0

	    	

	    	@flag = true
	    	
	    	#create ne DB record for a session
	    	@newChat = Chat.new
	    	
			
	    	
	    	#create session and session ID
	    	@session = opentok.create_session :media_mode => :routed
	    	$session = @session
	    	@session_id = @session.session_id

	    	#set values for new DB record
	    	@newChat.room_name = "main room"
	    	@newChat.session_id = @session_id
	    	@newChat.save!
	    	
	    	
	    	
	    	puts "created new session"
			
	    	
			#create Token
			if user_signed_in? && current_user.nickname != ""
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname+"@"+@ipAddress
    			puts "created new token for user with nickname"
    		
    		elsif user_signed_in? && current_user.nickname == ""

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s+"@"+@ipAddress
    			puts "created new token for user with random nickname"
    		
    		elsif !user_signed_in?
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s+"@"+@ipAddress
    			puts "created new token for guest"

    		end


		# else if there is an existing room
		else 

			#search for ip in DB to see if user is connected
			@numberOfTimesIpIsInConnectDb = Connect.where("ip = ?", @ipAddress)

			#get first session ID from DB
			@newChat = Chat.first
			@session_id = @newChat.session_id

			
		    #create token
		    if user_signed_in? && current_user.nickname != "" && @numberOfTimesIpIsInConnectDb.length == 0
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname+"@"+@ipAddress
    			puts "TOKEN CREATION 1"
    			
    		elsif user_signed_in? && current_user.nickname == "" && @numberOfTimesIpIsInConnectDb.length == 0

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s+"@"+@ipAddress
    			puts "TOKEN CREATION 2"
    			
    		elsif !user_signed_in? && @numberOfTimesIpIsInConnectDb.length == 0
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s+"@"+@ipAddress
				puts "TOKEN CREATION 3"
				
			elsif @numberOfTimesIpIsInConnectDb.length > 0

				puts "**Unable to create dual service token ****************"
			end

    	end
	    
	end


	
	def stats

		#respond_to do |format| 
		#    puts "connectionCreated is = " + params[:event] 
		#    puts "USERNAME is = "+ params[:connection][:data]
		#    @userName = params[:connection][:data]

    	#	format.js
    	#end
    	puts "Stats Action Starting............"

    	begin
		    puts "incomming event: " + params[:event]
		    method = "handle_" + params[:event]
		    self.send method, params[:connection][:data]
		    puts "back to stats action for no reason"
		rescue JSON::ParserError => e
			render json: {:status => 400, :error => "Invalid payload"} and return
		rescue NoMethodError => e
			puts "no method error"
		end
			 
		

		respond_to do |format|
	     
	        
	        format.js   { render :json => {:status => 200} }
	        #format.json { render :show, status: :created, location: @comment }
	      
	    end
	end


	def handle_connectionCreated(event)

	  puts "hanble connection crated action Starting............"
	  
	  tokenData = params[:connection][:data]

	 

	  #puts "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiin hcc event is " + params[:connection][:id]


	  ipString = tokenData.partition('@').last

	  newIpToSaveInDb = Connect.new(:ip => ipString)
	  newIpToSaveInDb.save
	  puts "saved " + ipString + " to DB"
	end

	def handle_connectionDestroyed(event)
	  
	  tokenData = params[:connection][:data]

	  ipString = tokenData.partition('@').last


	  ipSearchResult = Connect.where("ip = ?", ipString)

	  if ipSearchResult.length > 0

	  	puts "IP(s) have been purged**************"
	  	ipSearchResult.destroy_all
	  else
	  	puts "NO IP(s) have been harmed in the making of the notice********"
  	  end

	end


	def switchSession

		@api_key = ENV['api_key']
	    api_secret = ENV['api_secret']
		    
		    
	    opentok = OpenTok::OpenTok.new @api_key, api_secret
	    
	    @allChats = Chat.all

	    numbr = rand(400..5000)
    	@ipAddress = request.remote_ip
    	puts "IP address is = "+ @ipAddress
		
		

		puts "Switched Session +++++++++++++++++++ " + params[:room]
		roomID = params[:room]
		@allChats = Chat.all

		@newChat = Chat.find(roomID)
		
		
		

		puts @newChat.id.to_i.to_s + " <--------------------"
		puts "MY ID IAS sSSSSSSS " 

		@session_id = @newChat.session_id
		#create token
	    if user_signed_in? && current_user.nickname != ""
			puts "SESSION ID ++++++ IS "+ @newChat.session_id
			@token = opentok.generate_token @session_id, :data => current_user.nickname+"@"+@ipAddress
			puts "TOKEN CREATION 1"
			
		elsif user_signed_in? && current_user.nickname == ""

			@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s+"@"+@ipAddress
			puts "TOKEN CREATION 2"
			
		elsif !user_signed_in?
			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s+"@"+@ipAddress
			puts "TOKEN CREATION 3"
			
		
		end


		respond_to do |format|
	      
	        format.html { render(:text => "not implemented") }
	        format.js   { }
	        #format.json { render :show, status: :created, location: @comment }
	      
	    end

		#render 'demo.html.erb'

	end



	def createSession

		numbr = rand(400..5000)
    	@ipAddress = request.remote_ip
    	puts "IP address is = "+ @ipAddress

		@api_key = ENV['api_key']
	    api_secret = ENV['api_secret']
		    
		    
	    opentok = OpenTok::OpenTok.new @api_key, api_secret
	
		
	    
		#get the room name from userInput form
		@newRoomName = params[:chat][:room_name]

		puts "new room name is "+ params[:chat][:room_name]
		
		

		#create ne DB record for a session
    	@newChat = Chat.new

    	
		
    	
    	#create session and session ID
    	@session = opentok.create_session :media_mode => :routed
    	@session_id = @session.session_id

    	#set values for new DB record
    	@newChat.room_name = @newRoomName
    	@newChat.session_id = @session_id
    	@newChat.save!
    	
    	
    	
    	puts "created brand new session"
		
    	
		#create Token
		if user_signed_in? && current_user.nickname != ""
			
			@token = opentok.generate_token @session_id, :data => current_user.nickname+"@"+@ipAddress
			puts "created new token for user with nickname"
		
		elsif user_signed_in? && current_user.nickname == ""

			@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s+"@"+@ipAddress
			puts "created new token for user with random nickname"
		
		elsif !user_signed_in?
			
			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s+"@"+@ipAddress
			puts "created new token for guest"

		end


		respond_to do |format|
	      if @newChat.save
	        format.html { render(:text => "not implemented") }
	        format.js   { }
	        #format.json { render :show, status: :created, location: @comment }
	      else
	        #format.html { render :new }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
	end



	def deleteSession
		puts "DElete SESSIon XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" + params[:query]

		@roomToDelete = Chat.find(params[:query])

		@roomToDelete.destroy
		
		
		respond_to do |format|
	      if Chat.exists?(@roomToDelete)
	        format.html { render(:text => "not implemented") }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	        
	        #format.json { render :show, status: :created, location: @comment }
	      else
	        format.html { render(:text => "not implemented") }
	        format.js   { }
	      end
	    end

	end

	
  
  
  
end
