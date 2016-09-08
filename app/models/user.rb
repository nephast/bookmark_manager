require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

# This class corresponds to a table in the database
class User

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :email,    String, required: true, format: :email_address
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email

  # when assigned the password, we don't store it directly
    # instead, we generate a password digest, that looks like this:
    # "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
    # and save it in the database. This digest, provided by bcrypt,
    # has both the password hash and the salt. We save it to the
    # database instead of the plain password for security reasons.
    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(email, password)
      user = User.first(:email => email)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        else
          nil
        end
    end
end
