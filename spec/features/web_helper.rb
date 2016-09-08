def add_link_with_bubble_tag
  visit('/links/new')
  fill_in('url', with: 'http://www.facebook.com')
  fill_in('title', with: 'Facebook')
  fill_in('tags', with: 'bubbles')
  click_button 'save'
end


def sign_up(email: 'littlethao@me.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/sign_up'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end

def sign_up_no_email(password: '12345678')
    visit '/sign_up'
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button 'Sign up'
end

def sign_in(email: 'littlethao@me.com', password: '12345678')
  visit '/sign_in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def recover_password(email: 'littlethao@me.com')
  sign_in(password: 'wrong')
  click_link 'Forgot password'
  fill_in :email, with: email
  click_button 'Recover password'
end
