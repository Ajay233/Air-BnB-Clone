require_relative '../web_helpers'

feature 'Sign up' do
  scenario 'can navigate from index to user sign up page' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_current_path '/users/new'
  end

  scenario 'page has correct content' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content 'Sign up below'
  end

  scenario 'a user can sign up' do
    sign_up

    expect(page).to have_content 'Welcome, testusername'
  end

  scenario 'will get an error message if username exists' do
    sign_up
    click_link 'Sign up'
    fill_in('name', with: 'testname')
    fill_in('username', with: 'Ajay123')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content 'That user already exists, please try again'
  end
end
