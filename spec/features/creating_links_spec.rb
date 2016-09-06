# require 'spec_helper'

feature 'Creating links' do
  scenario 'add new links to BookmarkManager' do
    visit('/links/new')
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('title', with: 'Facebook')
    click_button 'save'

    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end
end
