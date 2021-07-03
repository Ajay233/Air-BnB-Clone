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

def setup_multiple_spaces
  10.times do |num|
    space_db_params_multidate = {
      name: "house#{num}",
      description: '2-bedroom house',
      date_available: "2018-#{num + 1}-20", booked: 'f',
      owner_id: '1'
    }
    Space.create(space_db_params_multidate)
  end
end
