require_relative '../web_helpers'
feature 'Sign in' do
 scenario 'can navigate from index to user sign up page' do
   visit "/"
   click_link "Sign in"
   expect(page).to have_current_path "/sessions/new"
 end

 scenario 'can navigate from index to user sign up page' do
   sign_up
   click_link "Sign in"
   fill_in('email', with: 'test@example.com')
   fill_in('password', with: 'password123')
   click_button('Submit')
   expect(page).to have_content "Welcome, testusername"
 end

 def sign_up
   visit "/"
   click_link "Sign up"
   fill_in('name', with: 'somename')
   fill_in('username', with: 'testusername')
   fill_in('email', with: 'test@example.com')
   fill_in('password', with: 'password123')
   click_button('Submit')
 end

end
