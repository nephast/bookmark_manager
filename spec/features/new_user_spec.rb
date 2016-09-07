require 'spec_helper'
require './app/models/user'

feature 'add new user' do

  subject(:user) { described_class.new }

  scenario 'user signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, email@isp.com"
    expect(User.first.email).to eq('email@isp.com')
  end
end
