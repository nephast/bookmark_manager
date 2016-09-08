require 'spec_helper'
require './spec/features/web_helpers'

feature 'password confirmation' do
  scenario 'no new user created if mismatching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Please refer to the following errors below: Password does not match the confirmation Please sign up')
  end
end
