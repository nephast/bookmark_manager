require_relative 'web_helper'

feature 'Sign up' do

  before do
    Capybara.reset_session!
  end

  scenario 'user signs up to bookmark manager site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, littlethao@me.com')
    expect(User.first.email).to eq 'littlethao@me.com'
  end

  scenario 'user signs up with a mismatching password' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq "/sign_up"
    expect(page).to have_content "Password and confirmation password do not match"
  end

  scenario 'user cannot sign up without email' do
    expect{ sign_up_no_email}.not_to change(User, :count)
  end

  scenario 'user signs up with wrong format email' do
    expect{ sign_up(email: 'wrongemail')}.not_to change(User, :count)
  end


end
