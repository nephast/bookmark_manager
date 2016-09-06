require './app/data_mapper_setup.rb'

class Tag

  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :links, through: Resource

end
