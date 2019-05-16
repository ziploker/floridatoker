class LookupsController < ApplicationController
  
  #  before_filter :cors_preflight_check
  #  after_filter :cors_set_access_control_headers

  skip_before_action :verify_authenticity_token

  require './lib/web_scraper.rb'
  require 'nokogiri'
  require 'httparty'
  require 'pry'

    

  # For all responses in this controller, return the CORS access control headers.
  #def cors_set_access_control_headers
    #headers['Access-Control-Allow-Origin'] = '*'
    #headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #headers['Access-Control-Request-Method'] = '*'
    #headers['Access-Control-Allow-Headers'] = '*'
    #headers['Access-Control-Max-Age'] = "1728000"
  #end
  #  
   # def cors_preflight_check
   # if request.method == :options
    #  headers['Access-Control-Allow-Origin'] = '*'
   #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #  headers['Access-Control-Allow-Headers'] = '*'
    #  headers['Access-Control-Request-Method'] = '*'
    #  headers['Access-Control-Max-Age'] = '1728000'
    #  render :text => '', :content_type => 'text/plain'
 # end

def info
    flash[:lat] = params[:lat]
    flash[:lng] = params[:lng]
    
    respond_to do |format|
      #format.html { redirect_to(person_list_url) }
      format.js {render :js => "window.location = '/find/all'"}
      #format.xml  { render :xml => @person.to_xml(:include => @company) }
    end

 
end

  def new

    @lat = flash[:lat]
    @lng = flash[:lng]


   

    query = "{
            people(latitude: #{flash[:lat]}, longitude: #{flash[:lng]}, first: 2) {
              edges {
                node {
                  name
                  givenName
                  familyName
                  image
                  party: currentMemberships(classification:\"party\") {
                    organization {
                        name
                      }
                  }
                  contactDetails {
                  note
                  type
                  value
                }
                  chamber: currentMemberships(classification:[\"upper\", \"lower\"]) {
                    post {
                      label
                    }
                    organization {
                      name
                      classification
                      parent {
                        name
                      }
                    }
                  }
                }
              }
            }
          }"
        
    
    url = "https://openstates.org/graphql"
    
    

    body = {
      
      "query" => query
    }

    headers = {

      "X-API-KEY" => ENV['sunlight_foundation_api_key']
    }


    result = HTTParty.post(url, :body => body, :headers => headers)
    
    @jsonResults = JSON.parse(result.body).to_json

    puts @jsonResults


    

    
    #render :nothing => true
    #@jsonFile = {one: "someshit", two: request.body}

    #respond_to do |format|
      
     # format.json  { render json: @JO}

   # end


   #puts @JO.to_s


    
    
  end
  
  def all
    
  end 

  def api

    query = "{
            people(latitude: #{params[:lat]}, longitude: #{params[:lng]}, first: 100) {
              edges {
                node {
                  name
                  givenName
                  familyName
                  image
                  party: currentMemberships(classification:\"party\") {
                    organization {
                        name
                      }
                  }
                  contactDetails {
                  note
                  type
                  value
                }
                  chamber: currentMemberships(classification:[\"upper\", \"lower\"]) {
                    post {
                      label
                    }
                    organization {
                      name
                      classification
                      parent {
                        name
                      }
                    }
                  }
                }
              }
            }
          }"
        
    
    url = "https://openstates.org/graphql"
    
    

    body = {
      
      "query" => query
    }

    headers = {

      "X-API-KEY" => ENV['sunlight_foundation_api_key']
    }


    result = HTTParty.post(url, :body => body, :headers => headers)
    
    @JO = JSON.parse(result.body)

    
    #render :nothing => true
    #@jsonFile = {one: "someshit", two: request.body}

    respond_to do |format|
      
      format.json  { render json: @JO}

    end
    
  end

  

  def getinfo

    api_key = ENV['google_search_api_key']

  	@name = params[:name]

    puts "name is "+ @name
  	
    search_phrase_encoded = URI::encode(@name)

    puts "name encoded is "+ search_phrase_encoded
  	
    thc = HTTParty.get("https://www.googleapis.com/customsearch/v1?q=#{search_phrase_encoded}&cx=003645805095083477600%3A7hraibewjhe&siteSearch=lobbytools.com&key=#{api_key}")

    puts " apiKEY is "+ api_key.to_s

    puts "https://www.googleapis.com/customsearch/v1?q=#{search_phrase_encoded}&cx=003645805095083477600%3A7hraibewjhe&siteSearch=lobbytools.com&key=#{ENV['api_key']}"

    theLink = thc["items"][0]["link"]

    doc = HTTParty.get(theLink)

    @parse_page = Nokogiri::HTML(doc)

    selector = "//a[starts-with(@href, \"mailto:\")]/@href"


    nodes = @parse_page.xpath selector

    address = nodes.collect {|n| n.value[7..-1]}

  	value = web_scraper
    
    

    

    

    

    #puts address

    #return address + @name
  	
  	#value = address + @name



  	
  	

  	
  	

  
  
  

    

    


    #puts "https://www.googleapis.com/customsearch/v1?q=#{search_phrase_encoded}&cx=003645805095083477600%3A7hraibewjhe&siteSearch=lobbytools.com&key=AIzaSyAbTbFbYQsj-on_JDtx_5uIgxUWeiNZCzc"

    #seid = "003645805095083477600:7hraibewjhe"

    #jsonFile = JSON.parse(thc.to_s)
    #link = jsonFile.items[0].link

    respond_to do |format|
      
      format.json  { render json: {"missingEmail" => address}}

    end
  end

  def get_bills

    


    url = "https://openstates.org/graphql"
  
  

    body = {
      
      "query" => params[:search]
    }

    headers = {

      "X-API-KEY" => ENV['sunlight_foundation_api_key']
    }


    result = HTTParty.post(url, :body => body, :headers => headers)
    
    @bills = JSON.parse(result.body)



    
    #render :nothing => true
    #@jsonFile = {one: "someshit", two: request.body}

    respond_to do |format|
      
      format.json  { render json: {"bills" => @bills}}

    end
  

  end

    



  
  
  
end
