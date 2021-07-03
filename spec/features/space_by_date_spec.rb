require_relative '../web_helpers'

feature 'list between dates' do
  before 'testing listing availability' do
    sign_up
    setup_multiple_spaces
  end

  scenario 'can select a date range and return correct results' do
    visit '/'
    fill_in 'date_from', with: '2018-02-01'
    fill_in 'date_to', with: '2018-07-25'
    click_button 'Search'

    (2..7).each do |num|
      expect(page).to have_content "Date available: 2018-0#{num}-20"
    end
  end
end
