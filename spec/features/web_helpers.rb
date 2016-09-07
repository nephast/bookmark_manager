def add_link
  visit '/links/new'
  fill_in 'url', with: 'http://www.facebook.com/'
  fill_in 'title', with: 'Facebook'
end

def sign_up
  visit '/users/new'
  fill_in :email, with: 'email@isp.com'
  fill_in :password, with: 'password'
  click_button 'Submit'
end
