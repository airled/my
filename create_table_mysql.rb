require 'sequel'
require 'mysql2'
 
database=Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :user=>'root', :database=>'test')
 
puts 'Enter the name of the table'
tabname=gets.chomp
 
#creating an array of the column names
puts 'Enter the names of the columns (enter "-s" to stop)'
colnames=[]
loop do
  name=gets.chomp
  break if name=='-s'
  colnames.push name
end
 
#creating value aggregating array
puts 'Enter the row values separated with "," (enter "-s" to stop)'
aggrarr=[]
loop do
  arr=[]
  val=gets.chomp
  break if val=='-s'
  arr=val.split(',')
  aggrarr.push arr
end

#creating a table
database.create_table tabname.to_sym do
  primary_key :id
end
 
#adding the columns
colnames.map do |colname|
  database.alter_table tabname.to_sym do
    add_column colname , String
  end
end
 
dataset=database[tabname.to_sym]
 
#filling the values
a = aggrarr.map do |row|
  Hash[colnames.zip(row)]
end
dataset.multi_insert(a)
