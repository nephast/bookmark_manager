require 'spec_helper'
require './app/models/user'

feature 'add new user' do

  subject(:user) { described_class.new }

  scenario 'user signs up' do
    visit '/users/new'
    fill_in :email, with: 'email@isp.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_content "Welcome, email@isp.com"
  end
end
