ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/users'


  #run! if app_file == $0
