require 'sinatra/base'
require './database_connection_setup'
require 'sinatra/flash'

class Airbnb < Sinatra::Base
  enable :sessions
  set :layout, true
  register Sinatra::Flash

  get '/' do
    User = Struct.new("User",:username)
    p @user = User.new(session[:username])
    other_user = "Ajay123"
    if @user.username == other_user
      flash[:notice] = "Computer says nooo"
    else
      flash[:notice] = "Success!!!"
    end
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
    array = Array.new
    p array.push(@user.username)
    redirect '/'
  end

  run! if app_file == $0
end
