def add_link_with_bubble_tag
  visit('/links/new')
  fill_in('url', with: 'http://www.facebook.com')
  fill_in('title', with: 'Facebook')
  fill_in('tags', with: 'bubbles')
  click_button 'save'
end
