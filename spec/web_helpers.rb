def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in('name', with: 'somename')
  fill_in('username', with: 'testusername')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end

def sign_in
  click_link 'Sign in'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end

def add_space
  sign_up
  sign_in
  click_button 'Add space'
  fill_in('name', with: 'Flat1')
  fill_in('description', with: 'Small flat')
  fill_in('date_available', with: '2018-12-20')
  click_button('Submit')
end
