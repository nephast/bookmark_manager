def add_link_with_bubble_tag
  visit('/links/new')
  fill_in('url', with: 'http://www.facebook.com')
  fill_in('title', with: 'Facebook')
  fill_in('tags', with: 'bubbles')
  click_button 'save'
end

def sign_up
  visit('/sign_up')
  expect(page.status_code).to eq(200)
  fill_in('email', with: 'littlethao@me.com')
  fill_in('password', with: 'abcdef1')
  click_button 'Sign up'
end
