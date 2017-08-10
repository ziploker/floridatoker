class ChatsController < ApplicationController
  require 'opentok'
  
  
  def demo
    
    
    api_key = ENV['api_key']
    api_secret = ENV['api_secret']
    @session_id = ENV['session_id']
    
    opentok = OpenTok::OpenTok.new api_key, api_secret
    
    numbr = rand(400..900)
    
    
    @token = opentok.generate_token @session_id, :data => 'guest_' + numbr.to_s
    
    
    
  end
  
  
  
end
