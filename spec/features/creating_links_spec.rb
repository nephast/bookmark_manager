require 'spec_helper'

feature 'adding links' do

  scenario 'user can add url and title and expect to see it on /links' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    click_button("Add link")
    expect(page).to have_content('Makers Academy')
  end

end
