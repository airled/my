require 'nokogiri'
require 'open-uri'
require 'curb'

def infile(html,file)
  File.open("#{Dir.home}/#{file}",'w') { |x| x.puts html }
end
  
html_noko = Nokogiri::HTML(open('http://ya.ru'))
html_curl = Curl::Easy.perform("http://ya.ru").body

infile(html_noko,'noko.html')
infile(html_curl,'curb.html')
