require_relative 'web_helper'

feature 'Sign out' do

  before do
    Capybara.reset_session!
  end

  scenario 'user signs out from bookmark manager site' do
    sign_up
    sign_in
    click_link('Sign out')
    expect(current_path).to eq "/links"
    expect(page).to have_content 'Goodbye, littlethao@me.com'
  end
end
