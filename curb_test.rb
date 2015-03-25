require 'curb'
require 'nokogiri'
require 'open-uri'

file=File.open('/home/air/Desktop/1.txt','w')
arr=[]
#i=1
puts
doc = Nokogiri::HTML(open('http://www.catalog.onliner.by'))
#doc.xpath("//table[@class='fphotblock add_line_main_menu']//ul[@class='b-catalogitems']/li/a[1]/@href").each do |link|
#/tbody/tr/td/div/ul/li
doc.xpath("//table[@class='fphotblock add_line_main_menu']//div/a[1]/@href").each do |link|
#doc.xpath("//table[@class='fphotblock add_line_main_menu']//li").each do |link|
	arr.push link.value
	#arr.push i.to_s+' - '+link
	#i+=1
end
puts arr.size
arr=arr.sort

i=1
arr.map do |val|
	arr[i-1]=i.to_s+' - '+arr[i-1]
	i+=1
end

file.puts arr
file.close
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