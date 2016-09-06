require './app/data_mapper_setup.rb'

class Tag

  include DataMapper::Resource

  property :id, Serial
  property :name, String

end
