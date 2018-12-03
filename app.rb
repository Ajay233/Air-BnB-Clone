require 'sinatra/base'

class Airbnb < Sinatra::Base
  enable :sessions

  get '/' do
    p "Hello, World!"
  end

  run! if app_file == $0
end
