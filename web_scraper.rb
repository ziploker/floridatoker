require 'nokogiri'

require 'httparty'

require 'pry'


require 'byebug'

def scraper(email)

	selector = "//a[starts-with(@href, \"mailto:\")]/@href"

	doc = HTTParty.get("https://public.lobbytools.com/legislators/724")



	@parse_page = Nokogiri::HTML(doc)

	nodes = @parse_page.xpath selector

	address = nodes.collect {|n| n.value[7..-1]}

	puts address

	return "tadaaa"
	

	#console.log(addresses)
	#byebug
end

scraper