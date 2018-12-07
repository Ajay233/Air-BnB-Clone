require_relative '../web_helpers'

feature 'Request a space' do
  scenario 'can navigate from index to request space form' do
    sign_up
    sign_in
    add_space
    click_button('Request this space')
    expect(page).to have_content 'Are you sure you wish to request this space?'
  end
end
