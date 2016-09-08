def add_link
  visit '/links/new'
  fill_in 'url', with: 'http://www.facebook.com/'
  fill_in 'title', with: 'Facebook'
end

def sign_up(email: 'email@isp.com',
  password: '1234',
  password_confirmation: '1234')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end
