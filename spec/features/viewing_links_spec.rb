require 'spec_helper'

feature 'viewing links' do
  scenario 'I can see a list of links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit "/links"
    expect(page).to have_content('List Of Links')
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
