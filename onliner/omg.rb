require 'sequel'
require 'mysql2'
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open('http://www.catalog.onliner.by'))

#array of URLS
xrequest="//table[@class='fphotblock add_line_main_menu']//div/a[1]/@href"
urls = doc.xpath(xrequest).map{ |link| link.value }.uniq

DB=Sequel.connect(:adapter=>'mysql2', :user=>'root', :host=>'localhost', :database=>'test')

#DB.run('drop table if exists urls')

class Url < Sequel::Model
end

urls.map { |url| Url.create(:url=>url) }