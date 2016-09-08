ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'controllers/user.rb'
require_relative 'controllers/links.rb'

class BookmarkManager < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb

  get '/' do
    'Hello BookmarkManager!'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
