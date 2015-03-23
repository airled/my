require 'sequel'
require 'mysql2'

# Create an in-memory database
DB=Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :user=>'root', :database=>'air')

# Create a new Country table with columns of
# id, name, and population.
DB.create_table :tab do 
    primary_key :id
    String :name
    Integer :population
end

# Create a Country model.
class Country < Sequel::Model(:tab); end

# Add some countries using our model. Note the id tag
# should get filed in automatically.
Country.create(:name => 'U.S.A.', :population => 10)
Country.create(:name => 'Mexico', :population => 20)
Country.create(:name => 'Canada', :population => 30)
Country.create(:name => 'France', :population => 40)

# U.S.A note the values are accessed as a hash of the column names.

c1 = Country[:name => 'Canada']
c2=DB[:tab].where(:name=>'Canada')

p c1[:population]
p c2.select(:population)