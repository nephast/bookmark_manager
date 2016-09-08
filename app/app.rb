ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.id == nil
      flash[:error] = "Password and confirmation password do not match"
      flash[:email] = params[:email]
      redirect '/sign_up'
    else
    redirect '/links'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
