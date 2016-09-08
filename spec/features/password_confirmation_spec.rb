require 'spec_helper'
require './spec/features/web_helpers'

feature 'password confirmation' do
  scenario 'no new user created if mismatching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end
