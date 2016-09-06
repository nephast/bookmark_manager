require 'spec_helper'

feature 'tagging links' do
  scenario 'user can tag links from bookmark manager' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp')
    click_button("Add link")
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bootcamp')
  end
end
