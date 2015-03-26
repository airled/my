require 'sequel'
require 'mysql2'

# Create an in-memory database
DB=Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :user=>'root', :database=>:air)

# Create a new Country table with columns of
# id, name, and population.
DB.create_table :countries do 
  primary_key :id
  column :name, :text, :unique=>true
  column :population, :integer
end

# Create a Country model.
class Country < Sequel::Model
end

# Add some countries using our model. Note the id tag
# should get filed in automatically.
Country.create(:name => 'U.S.A.', :population => 250000000)
Country.create(:name => 'Mexico', :population => 251000000)
Country.create(:name => 'Canada', :population => 252000000)
Country.create(:name => 'France', :population => 300000000)

# U.S.A note the values are accessed as a hash of the column names.
usa = Country[:name => 'U.S.A.']
puts "USA: #{usa[:name]} #{usa[:population]}" 

# or as attributes (should print the same as above).
puts "USA population: #{usa.name} #{usa.population}" 

# Populations under (or equal to) 251 million
puts "Populations <= 251000000"
Country.filter(:population <= 251000000).each{|country| puts "Country #{country[:name]} #{country[:population]}" }

# Change the USA population (should print 100 more than the above).
usa.population = 250000100
puts "USA population: #{usa.name} #{usa.population}" 

# Populations under (or equal to) 251 million. Note that U.S
# is not changed.
puts "Populations <= 251000000"
Country.filter(:population <= 251000000).each{|country| puts "Country #{country[:name]} #{country[:population]}" }

usa.update(:population => 250000200)
puts "USA: #{usa.name} #{usa.population}" 

# Populations under (or equal to) 251 million
puts "Populations <= 251000000"
Country.filter(:population <= 251000000).each{|country| puts "Country #{country[:name]} #{country[:population]}" }

# Get the country with the ID of 3.
country = Country[3]
puts "Country 3 #{country[:name]} #{country[:population]}" 

# Populations under (or equal to) 251 million
puts "Populations <= 251000000"
Country.filter(:population <= 251000000).each{|country| puts "Country #{country[:name]} #{country[:population]}" }