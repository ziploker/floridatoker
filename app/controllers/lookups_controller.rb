class LookupsController < ApplicationController
  
#  before_filter :cors_preflight_check
#  after_filter :cors_set_access_control_headers

require './lib/web_scraper.rb'

  respond_to do |format|
  	format.js
	  format.html {}
	     
	end

# For all responses in this controller, return the CORS access control headers.

#def cors_set_access_control_headers
#  headers['Access-Control-Allow-Origin'] = '*'
#  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#  headers['Access-Control-Request-Method'] = '*'
#  headers['Access-Control-Allow-Headers'] = '*'
#  headers['Access-Control-Max-Age'] = "1728000"
#end
#  
#  def cors_preflight_check
#  if request.method == :options
#    headers['Access-Control-Allow-Origin'] = '*'
#    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#    headers['Access-Control-Allow-Headers'] = '*'
#    headers['Access-Control-Request-Method'] = '*'
#    headers['Access-Control-Max-Age'] = '1728000'
#    render :text => '', :content_type => 'text/plain'
#  end
#end
  def new
    
  end
  
  def all
    
  end 

  def getinfo

  	@newD = params[:var1]
  	@newDJS = @newD+"67676"

  	#puts @newD + " addddsdfsdfdd"
  	#respond_with(@newD)
  	
  	#return @newDJS

  	value = web_scraper
  	
  	



  	render json: {"email" => value}
  	

  	
  	

  end
  
  
  
end
