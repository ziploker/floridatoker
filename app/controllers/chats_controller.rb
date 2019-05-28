class ChatsController < ApplicationController
	require 'opentok'
	  
	  
	def demo

		@api_key = ENV['api_key']
	    api_secret = ENV['api_secret']
		    
		    
	    opentok = OpenTok::OpenTok.new @api_key, api_secret
	    
	    @allChats = Chat.all

	    numbr = rand(400..900)
    
    
    
	    
	    
	    if @allChats.length == 0
	    	
	    	#create ne DB record
	    	@newChat = Chat.new
	    	
	    	#create session and session ID
	    	@session = opentok.create_session :media_mode => :routed
	    	@session_id = @session.session_id

	    	#set values for new DB record
	    	@newChat.room_name = "main room"
	    	@newChat.session_id = @session_id

	    	#save new record
	    	@newChat.save!
	    	puts "created new session"
			#@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
	    	@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s





		else 

			@newChat = Chat.first
			@session_id = @newChat.session_id




		    
		    #@session = opentok.create_session :media_mode => :routed
		    #numbr = rand(400..900)
		    #session_id = @session.session_id
		    #@session = ENV['session_id']
		    #@session_id = ENV['session_id']
		    
		   	#@token = @session.generate_token
		   	#@token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
		    @token = opentok.generate_token @newChat.session_id, :data => 'guest_' + numbr.to_s




		    #@token = opentok.generate_token :role => :publisher
		    puts "session = "+ @session.to_s
		    puts "SESSION ID = " + @session_id
		    puts "TOKEN = "+ @token
	    end
	    
	end
  
  
  
end
