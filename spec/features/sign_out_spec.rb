describe 'Sign out' do
  scenario 'can end a session and sign a user out' do
    sign_up
    click_link 'Sign out'

    expect(page).to_not have_content('Welcome, testusername')
    expect(page).to have_content('You have signed out')
  end
end
