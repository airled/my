require 'sequel'
require 'mysql2'
require 'pry'
require 'logger'

database=Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :user=>'root', :database=>'test')

#database.loggers << Logger.new($stdout)

database.run('drop table if exists artists')
database.create_table(:artists) do
	primary_key :id
	String :name
	String :country
end

database.run('drop table if exists albums')
database.create_table(:albums) do
  primary_key :id
  Integer :artist_id
  String :name
end

class Artist < Sequel::Model
	plugin :validation_helpers
  one_to_many :albums		
end

class Album < Sequel::Model
  plugin :validation_helpers
  many_to_one :artist
end

Artist.create(:name=>'Covenant',:country=>'Sweden')
Artist.create(:name=>'Bad Sector',:country=>'Italy')
Artist.create(:name=>'Lustmord',:country=>'UK')
Artist.create(:name=>'Carbon Based Lifeforms',:country=>'Sweden')
Artist.create(:name=>'Aesthetische',:country=>'Brazil')

Album.create(:artist_id=>1,:name=>'Skyshaper')
Album.create(:artist_id=>1,:name=>'Sequencer')
Album.create(:artist_id=>1,:name=>'Europa')
Album.create(:artist_id=>2,:name=>'Plasma')
Album.create(:artist_id=>2,:name=>'CMASA')
Album.create(:artist_id=>2,:name=>'Kosmodrom')
Album.create(:artist_id=>3,:name=>'Metavoid')
Album.create(:artist_id=>3,:name=>'Beyond')
Album.create(:artist_id=>4,:name=>'Twentythree')
Album.create(:artist_id=>4,:name=>'Interloper')
Album.create(:artist_id=>5,:name=>'Powerswitch')
Album.create(:artist_id=>5,:name=>'Hybridcore')

artist=Artist[:name=>'Covenant']
artist.add_album(:name=>'Dreams Of A Cryotank')

album=Album.new(:name=>'OLOLO')
Artist.create(:name=>'2ch')
artist=Artist[:name=>'2ch']
album.artist=artist
album.save

=begin
Album.create(:name=>'PISH PISH OLOLO',:artist_id=>10)
album=Album[:name=>'PISH PISH OLOLO']
album.artist=Artist.create(:name=>'2ch')
=end