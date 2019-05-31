class ChatsController < ApplicationController
	require 'opentok'
	skip_before_action :verify_authenticity_token
	  
	  
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
	    	
	    	#create ne DB record
	    	@newChat = Chat.new
	    	@ip = Connect.new
	    	
	    	#create session and session ID
	    	@session = opentok.create_session :media_mode => :routed
	    	@session_id = @session.session_id

	    	#set values for new DB record
	    	@newChat.room_name = "main room"
	    	@newChat.session_id = @session_id

	    	@ip.ip = @ipAddress
	    	@ip.save
	    	#save new record
	    	@newChat.save!
	    	puts "created new session"
			#@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
	    	
			if user_signed_in? && current_user.nickname != ""
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname
    		
    		elsif user_signed_in? && current_user.nickname == ""

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s
    		
    		elsif !user_signed_in?
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s


    		end




		else 

			@numberOfTimesIpIsInConnectDb = Connect.where("ip = ?", @ipAddress)

			
			@newChat = Chat.first
			@session_id = @newChat.session_id

			@ip = Connect.new


		    
		    #@session = opentok.create_session :media_mode => :routed
		    #numbr = rand(400..900)
		    #session_id = @session.session_id
		    #@session = ENV['session_id']
		    #@session_id = ENV['session_id']
		    
		   	#@token = @session.generate_token
		   	#@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
		    if user_signed_in? && current_user.nickname != ""
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname
    			puts "TOKEN CREATION 1"
    			@ip.ip = @ipAddress
	    		@ip.save
    		elsif user_signed_in? && current_user.nickname == ""

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s
    			puts "TOKEN CREATION 2"
    			@ip.ip = @ipAddress
	    		@ip.save
    		elsif !user_signed_in?
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
				puts "TOKEN CREATION 3"
				@ip.ip = @ipAddress
	    		@ip.save
			
				
				

    		end

    		


		    #@token = opentok.generate_token :role => :publisher
		    #puts "session = "+ @session.to_s
		    #puts "SESSION ID = " + @session_id
		    #puts "TOKEN = "+ @token
	    
	    	
		end
	    
	end


	def connection

		puts "DISSCONNECT = " + params["ip"]

		#@allConnections = Connect.all

		userDisconnect = Connect.where("ip = ?", params["ip"])
		if userDisconnect.length > 1
			userDisconnect.each do |user|
				user.destroy
				puts "destroyed ALL ip address from connect list"

			end
		elsif userDisconnect.length < 1
			puts "couldent find "+params["ip"]+ " in db"
		else
			userDisconnect[0].destroy
			puts "destroyed ip address " + params["ip"]
		end

		render :nothing => true

	end

	def stats

		
	    puts "connectionCreated is = " + params[:event] 
	    puts "USERNAME is = "+ params[:connection][:data]
	    @userName = params[:connection][:data]

		#format.js { render 'chats/updateChat.js.erb' }
		render "alert('Hello Rails');"

		      
		    
  		

	end
  
  
  
end
