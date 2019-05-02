require 'nokogiri'

require 'httparty'

require 'pry'


require 'byebug'


	def web_scraper


		selector = "//a[starts-with(@href, \"mailto:\")]/@href"

		doc = HTTParty.get("https://public.lobbytools.com/legislators/724")



		@parse_page = Nokogiri::HTML(doc)

		nodes = @parse_page.xpath selector

		address = nodes.collect {|n| n.value[7..-1]}

		#puts address

		return address
		

		#console.log(addresses)
		#byebug
	end


web_scraper