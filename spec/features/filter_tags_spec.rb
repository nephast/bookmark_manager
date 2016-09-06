require 'spec_helper'

feature 'tag filtering' do

  scenario 'user only views links with tag "bubble"' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'bootcamp')])
    Link.create(url: 'http://www.shooter-bubble.com/', title: 'Shooter Bubble', tags: [Tag.first_or_create(name: 'bubbles')])
    visit '/tags/bubbles'
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).to have_content('Shooter Bubble')
    end
  end
end
