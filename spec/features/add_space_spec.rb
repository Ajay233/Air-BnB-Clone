require_relative '../web_helpers'

feature 'Add a space' do
  scenario 'can navigate from index to add space form' do
    sign_up
    sign_in
    click_button 'Add space'
    expect(page).to have_current_path '/spaces/new'
    expect(page).to have_content 'Add a new space'
  end

  scenario 'will get an error message if user is not signed in' do
    visit '/'
    click_button 'Add space'
    expect(page).to have_content 'You have to sign in to add a space'
  end

  scenario 'space added appears in the index page' do
    sign_up
    sign_in
    click_button 'Add space'
    fill_in('name', with: 'Flat1')
    fill_in('description', with: 'Small flat')
    fill_in('date_available', with: '2018-12-20')
    click_button('Submit')

    expect(page).to have_content('Flat1')
  end
end
