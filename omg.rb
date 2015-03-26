require 'sequel'
require 'mysql2'
require 'curb'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.catalog.onliner.by'))

#array of URLS
xrequest="//table[@class='fphotblock add_line_main_menu']//div/a[1]/@href"
urls = doc.xpath(xrequest).map{|link| link.value}.uniq

DB=Sequel.connect(:adapter=>'mysql2', :user=>'root', :host=>'localhost', :database=>'test')

DB.run('drop table if exists urls')
DB.create_table :urls do
	primary_key :id
	String :url
end

class Url < Sequel::Model
end

urls.map {|url| Url.create(:url=>url)}