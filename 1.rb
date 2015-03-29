require 'sequel'
require 'mysql2'
require 'nokogiri'
require 'open-uri'

file=File.open('/home/air/Desktop/1')
values=[]
file.each_line { |line| values.push line.chomp }
parameters=[:adapter,:user,:password,:host,:database]
connect_parameters=parameters.zip(values).to_h

DB=Sequel.connect(connect_parameters)