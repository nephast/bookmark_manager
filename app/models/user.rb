require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,     Serial
  property :email,    String, required: true, format: :email_address
  property :password, BCryptHash

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = User.first(:email => email)
      if user && BCrypt::Password.new(user.password) == password
        user
      else
        nil
      end
  end
end
