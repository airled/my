require 'sequel'
require 'mysql2'
require 'pry'
require 'logger'

database=Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :user=>'root', :database=>'test')

database.loggers << Logger.new($stdout)

database.run('drop table if exists artists')
database.create_table(:artists) do
	primary_key :id
	String :name
	String :option
end

database.run('drop table if exists albums')
database.create_table(:albums) do
  primary_key :id
  Integer :artist_id
  String :name
  String :option
end

class Artist < Sequel::Model
	plugin :validation_helpers
  one_to_many :albums		
end

class Album < Sequel::Model
  plugin :validation_helpers
  many_to_one :artist
end

Artist.create(:name=>'q',:option=>'a')
Artist.create(:name=>'w',:option=>'s')
Artist.create(:name=>'e',:option=>'d')
Artist.create(:name=>'r',:option=>'f')
Artist.create(:name=>'t',:option=>'g')

Album.create(:artist_id=>1,:name=>'y',:option=>'h')
Album.create(:artist_id=>2,:name=>'u',:option=>'j')
Album.create(:artist_id=>3,:name=>'i',:option=>'k')
Album.create(:artist_id=>1,:name=>'o',:option=>'l')
Album.create(:artist_id=>3,:name=>'p',:option=>':3')
Album.create(:artist_id=>4,:name=>'yq',:option=>'hz')
Album.create(:artist_id=>2,:name=>'uw',:option=>'jx')
Album.create(:artist_id=>3,:name=>'ie',:option=>'kc')
Album.create(:artist_id=>2,:name=>'or',:option=>'lv')
Album.create(:artist_id=>1,:name=>'pt',:option=>':33')

@artist=Artist[:name=>'w']

binding.pry
=begin
a=gets.chomp
b=gets.chomp

t1=Tab.new
t2=Tab.new
t1.name=a
t2.name=b
t1.save
t2.save
puts database[:tab].all
puts
t1.destroy
puts database[:tab].all 
=end
