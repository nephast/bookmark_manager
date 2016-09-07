require_relative 'web_helper'

feature 'Sign up' do
  scenario 'user signs up to bookmark manager site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, littlethao@me.com')
    expect(User.first.email).to eq 'littlethao@me.com'
  end
end
