class LookupsController < ApplicationController
  
#  before_filter :cors_preflight_check
#  after_filter :cors_set_access_control_headers

require './lib/web_scraper.rb'
require 'nokogiri'

require 'httparty'

require 'pry'

  respond_to do |format|
  	format.js
	  format.html {}
	     
	end

# For all responses in this controller, return the CORS access control headers.
def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Request-Method'] = '*'
  headers['Access-Control-Allow-Headers'] = '*'
  headers['Access-Control-Max-Age'] = "1728000"
end
#  
  def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end
  def new
    
  end
  
  def all
    
  end 

  def getinfo

    api_key = ENV['google_search_api_key']

  	@name = params[:name]
  	
    search_phrase_encoded = URI::encode(@name)
  	
    thc = HTTParty.get("https://www.googleapis.com/customsearch/v1?q=#{search_phrase_encoded}&cx=003645805095083477600%3A7hraibewjhe&siteSearch=lobbytools.com&key=#{api_key}")

    theLink = thc["items"][0]["link"]

    doc = HTTParty.get(theLink)

    @parse_page = Nokogiri::HTML(doc)

    selector = "//a[starts-with(@href, \"mailto:\")]/@href"


    nodes = @parse_page.xpath selector

    address = nodes.collect {|n| n.value[7..-1]}

  	#value = web_scraper
    
    

    

    

    

    #puts address

    #return address + @name
  	
  	#value = address + @name



  	
  	

  	
  	

  
  
  

    

    


    #puts "https://www.googleapis.com/customsearch/v1?q=#{search_phrase_encoded}&cx=003645805095083477600%3A7hraibewjhe&siteSearch=lobbytools.com&key=AIzaSyAbTbFbYQsj-on_JDtx_5uIgxUWeiNZCzc"

    #seid = "003645805095083477600:7hraibewjhe"

    #jsonFile = JSON.parse(thc.to_s)
    #link = jsonFile.items[0].link

    render json: {"missingEmail" => address} 



  end
  
  
end
