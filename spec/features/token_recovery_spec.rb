require_relative 'web_helper'

feature 'token recovery' do

  before do
    Capybara.reset_session!
    sign_up
    recover_password
  end

  scenario 'user enters token' do
    visit('/token')
    fill_in :token, with: User.first.token
      fill_in :new_password, with: "123"
    click_button('Change Password')
    expect(current_path).to eq "/links"
    expect(page).to have_content "Your password has been updated"
    sign_in(password: "123")
    expect(page).to have_content "Welcome, littlethao@me.com"
  end
  end
