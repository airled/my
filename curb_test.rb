require 'curb'
require 'nokogiri'
require 'open-uri'

a=File.open('/home/air/Desktop/1.txt','w')
b=[]
puts
doc = Nokogiri::HTML(open('http://www.catalog.onliner.by'))
doc.xpath("//table[@class='fphotblock add_line_main_menu']//li").each do |link|
	a.puts link.content
	b.push link.content
	#puts link.content
end
puts b.size
=begin
puts
http = Curl.get("http://www.nokogiri.org/tutorials/installing_nokogiri.html")
puts http.body
link=Curl::Easy.new("http://www.machinistmusic.net")
link.perform
puts link.head

a=["http://www.ya.ru/","http://www.machinistmusic.net"]
link1=Curl::Multi.get(a) do |addr|
puts
puts addr.head
end
=end