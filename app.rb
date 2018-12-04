require 'sinatra/base'
require './database_connection_setup'

class Airbnb < Sinatra::Base
  enable :sessions
  set :layout, true

  get '/' do
    User = Struct.new("User",:username)
    @user = User.new(session[:username])
    # @user = User.find(session[:user_id]
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User = Struct.new("User",:username, :email, :password)
    @user = User.new(
      params['username'],
      params['email'],
      params['password'])
    session[:username] = params['username'] #
    redirect '/'
  end

  run! if app_file == $0
end
