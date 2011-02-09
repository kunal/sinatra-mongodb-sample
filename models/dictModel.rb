require 'rubygems'
require 'mongo_mapper'

class DictionaryModel
  include MongoMapper::Document
  
  key :word, String, :required => true
  key :meaning, String, :required => true
end
