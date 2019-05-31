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
	    	
	    	#create ne DB record for a session
	    	@newChat = Chat.new
	    	
			
	    	
	    	#create session and session ID
	    	@session = opentok.create_session :media_mode => :routed
	    	@session_id = @session.session_id

	    	#set values for new DB record
	    	@newChat.room_name = "main room"
	    	@newChat.session_id = @session_id
	    	@newChat.save!
	    	
	    	
	    	
	    	puts "created new session"
			
	    	
			#create Token
			if user_signed_in? && current_user.nickname != ""
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname
    			puts "created new token for user with nickname"
    		
    		elsif user_signed_in? && current_user.nickname == ""

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s
    			puts "created new token for user with random nickname"
    		
    		elsif !user_signed_in?
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
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
				
				@token = opentok.generate_token @session_id, :data => current_user.nickname
    			puts "TOKEN CREATION 1"
    			
    		elsif user_signed_in? && current_user.nickname == "" && @numberOfTimesIpIsInConnectDb.length == 0

				@token = opentok.generate_token @session_id, :data => 'user_' + numbr.to_s
    			puts "TOKEN CREATION 2"
    			
    		elsif !user_signed_in? && @numberOfTimesIpIsInConnectDb.length == 0
    			
    			@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
				puts "TOKEN CREATION 3"
				
			
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
    	puts "INNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN"

    	begin
		    
		    method = "handle_" + params[:event]
		    self.send method, params[:event]
		    puts "INNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNrrrrrrrrrrNNNNNN"
		rescue JSON::ParserError => e
			render json: {:status => 400, :error => "Invalid payload"} and return
		rescue NoMethodError => e
			puts "INNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNrrrrrrrfffdddddrrrNNNNNN"
		end
			render json: {:status => 200}
	end


	def handle_connectionCreated(event)
	  puts "event HANDLED MOFO!!! " + params[:connection][:data]
	end

	def handle_invoice_payment_failed(event)
	  #handle the event
	end

	
  
  
  
end
