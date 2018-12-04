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
end
