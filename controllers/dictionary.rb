require 'rubygems'
require 'sinatra/base'
require 'erb'
require 'models/dictModel'

class Dictionaree < Sinatra::Base

  def initialize
    super
  end

  get '/' do
    erb :home
  end

  post '/' do
    #    "Hello #{params[:word]}"
    erb :home
  end
  
  get '/hit' do
    "hmm"
  end
  
end
