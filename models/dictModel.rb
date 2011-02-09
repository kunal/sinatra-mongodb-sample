require 'rubygems'
require 'mongo_mapper'

class Dictionary
  include MongoMapper::Document
  
  key :word, String, :required => true
  key :meaning, String, :required => true
end
