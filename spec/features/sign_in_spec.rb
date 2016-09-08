require_relative 'web_helper'

feature 'User signs in' do

  before do
    sign_up
    Capybara.reset_session!
  end

  scenario 'With Correct Email and Password' do
    sign_in
    expect(current_path).to eq "/links"
    expect(page).to have_content('Welcome, littlethao@me.com')
  end

  scenario 'With Incorrect Password' do
    sign_in(password: 'wrong')
    expect(current_path).to eq "/sign_in"
    expect(page).to have_content('Invalid Email/Password')
  end


end
