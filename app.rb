require 'sinatra/base'
require './database_connection_setup'
require 'sinatra/flash'
require './lib/models/user'
require './lib/models/space'

# Airbnb class that inherits from Sinatra::Base
class Airbnb < Sinatra::Base
  enable :sessions
  set :layout, true
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @spaces = Space.all
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  get '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user.nil?
      flash[:notice] = 'E-mail or Password was incorrect, ' \
                       'or you haven\'t signed up'
      redirect :"sessions/new"
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    begin
      user = User.create(name: params[:name],
                         username: params[:username],
                         email: params[:email],
                         password: params[:password])
      session[:user_id] = user.id
      redirect '/'
    rescue PG::UniqueViolation
      flash[:notice] = 'That user already exists, please try again'
      redirect :"users/new"
    end
  end

  get '/spaces/new' do
    user = User.find(id: session[:user_id])
    if user.nil?
      flash[:notice] = 'You have to sign in to add a space'
      redirect :'/sessions/new'
    end
    erb(:"spaces/new")
  end

  post '/spaces' do
    Space.create(
      name: params['name'],
      description: params['description'],
      date_available: params['date_available'],
      booked: 'f',
      owner_id: session[:user_id]
    )
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
