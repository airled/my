require './init_db'
require 'nokogiri'
require 'open-uri'
#require 'logger'

#DB.loggers << Logger.new($stdout)

#fetching HTML code
html = Nokogiri::HTML(open('http://www.catalog.onliner.by'))

#GROUPS
#collecting group names in an array
xgroups = "//h1[@class='cm__h1']"
groups = html.xpath(xgroups).map{ |node| node.text.delete("0-9") }

#CATEGORIES
#collecting category URLs in an array
xcategories = "//table[@class='fphotblock add_line_main_menu']//div[@class='i']"
categories = html.xpath(xcategories).map do |node|
  url = node.xpath("./a[1]/@href").text
  name = url.sub("http://catalog.onliner.by/","").delete('/')
  name_ru = node.xpath("./a[last()]").text
  is_new = node.xpath("./a[2]/img[@class='img_new']").any?
  {:name => name, :name_ru => name_ru, :url => url, :is_new => is_new}
end

#creating a model
class Group < Sequel::Model
 # many_to_many :categories
 # one_through_one :category
end
class Category < Sequel::Model
end
class Product < Sequel::Model
end
class GroupCategory < Sequel::Model(:categories_groups)
end

#inserting names of the groups
groups.map { |name| Group.create(:name_ru => name) }

#inserting category values
categories.map { |hash| Category.create(hash) }

#inserting in the common table
groups_count=1
categories_count=1
html.xpath("//ul[@class='b-catalogitems']").map do |group_node|
  group_node.xpath("./li").map do |category_node|
    common_count={:group_id => groups_count, :category_id => categories_count}
    GroupCategory.create(common_count)
    categories_count+=1
  end
  groups_count+=1
end
