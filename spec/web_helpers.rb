 def sign_up
   visit "/"
   click_link "Sign up"
   fill_in('name', with: 'somename')
   fill_in('username', with: 'testusername')
   fill_in('email', with: 'test@example.com')
   fill_in('password', with: 'password123')
   click_button('Submit')
 end
