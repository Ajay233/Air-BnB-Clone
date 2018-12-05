require_relative '../web_helpers'
feature 'Sign in' do
  scenario 'can navigate from index to user sign up page' do
    visit '/'
    click_link 'Sign in'
    expect(page).to have_current_path '/sessions/new'
  end

  scenario 'can navigate from index to user sign up page' do
    sign_up
    click_link 'Sign in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content 'Welcome, testusername'
  end

  scenario 'can not sign in if not signed up or using wrong credentials' do
    visit '/'
    click_link 'Sign in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content 'E-mail or Password was incorrect, ' \
                                 'or you haven\'t signed up'
  end
end
