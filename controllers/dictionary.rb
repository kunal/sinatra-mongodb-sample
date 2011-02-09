require 'rubygems'
require 'sinatra/base'
require 'erb'
require 'models/dictModel'

class Dictionaree < Sinatra::Base

  def initialize
    super
  end

  get '/' do
#    d = DictionaryModel.new(:word => "dhaval")
#    d.meaning = "jain"
#    d.save
    erb :home
  end

  post '/' do
    @meaning = DictionaryModel.find_by_word(params[:word])

    erb :home
  end
  
  get '/hit' do
    "hmm"
  end
  
end
