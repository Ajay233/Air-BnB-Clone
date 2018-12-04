require 'sinatra/base'
require './database_connection_setup'

class Airbnb < Sinatra::Base
  enable :sessions
  set :layout, true

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb(:"users/new")
  end

  run! if app_file == $0
end
