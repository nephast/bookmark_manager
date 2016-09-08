require 'spec_helper'
require './app/models/user'

feature 'add new user' do

  subject(:user) { described_class.new }

  scenario 'user signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, email@isp.com"
    expect(User.first.email).to eq('email@isp.com')
  end

  scenario 'user cannot sign up with blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up if email address already registered' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content ('Email is already taken Please sign up')
    end

end
