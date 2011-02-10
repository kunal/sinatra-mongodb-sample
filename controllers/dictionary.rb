require 'rubygems'
require 'sinatra/base'
require 'erb'
require 'yaml'
require 'models/dictModel'

class Dictionaree < Sinatra::Base

  def initialize
    super
  end

  get '/' do

    erb :home
  end

  post '/' do
    @match = DictionaryModel.find_by_word(params[:word])

    erb :home
  end
  
  get '/upload' do
    erb :upload
  end

  post '/upload' do
    tempfile = params[:uploadfile][:tempfile]

    FileUtils.mkdir_p("tmp/")
    uploadPath = 'tmp/' + Time.new.strftime("%H_%M_%S__%d_%m_%Y") + ".yaml"

    if FileUtils.copy_file(tempfile.path, uploadPath)
      @message = "File upload failed"
    else
      @message = "File upload done"
    end

    begin
      @words = YAML.load_file(uploadPath)
    rescue
      @message = "Invalid YAML file"
    end

    @words.each do |word, meaning|
      existing = DictionaryModel.where(:word => word.to_s).all

      existingCounter = 0

      existing.each do 
        existing[existingCounter].delete
        existingCounter = existingCounter + 1
      end

      d = DictionaryModel.new(:word => word.to_s)
      d.meaning = meaning.to_s
      
      begin
        d.save
      rescue
        @message = "Unable to save into Database"
      end
    end

    erb :upload
  end
  
end
