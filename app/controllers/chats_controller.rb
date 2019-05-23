class ChatsController < ApplicationController
  require 'opentok'
  
  
  def demo
    
    
    @api_key = ENV['api_key']
    api_secret = ENV['api_secret']
    
    
    opentok = OpenTok::OpenTok.new @api_key, api_secret
    @session = opentok.create_session :media_mode => :routed
    numbr = rand(400..900)
    #@session_id = @session.session_id
    @session_id = ENV['session_id']
    
   	@token = @session.generate_token
    #@token = opentok.generate_token :role => :publisher
    puts "SESSION ID = " + @session_id
    puts "TOKEN = "+ @token
    
    
  end
  
  
  
end
