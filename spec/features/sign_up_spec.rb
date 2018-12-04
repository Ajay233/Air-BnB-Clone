feature 'Sign up' do
  scenario 'can navigate from index to user sign up page' do
    visit "/"
    click_link "Sign up"
    expect(page).to have_current_path "/users/new"
  end

  scenario 'page has correct content' do
    visit "/"
    click_link "Sign up"
    expect(page).to have_content "Sign up below"
  end

  scenario 'a user can sign up' do
    visit "/"
    click_link "Sign up"
    fill_in('username', with: 'testusername')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, testusername"
  end
end
