require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Bookmark < Sinatra::Base
  get '/' do
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_links
  end

  post '/links' do
     link = Link.create(url: params[:url], title: params[:title])
     tag = Tag.first_or_create(name: params[:tags])
     link.tags << tag
     link.save
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
