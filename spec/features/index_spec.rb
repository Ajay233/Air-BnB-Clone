require 'spec_helper.rb'

feature 'Viewing homepage' do
  scenario 'initial test of homepage' do
    visit('/')

    expect(page).to have_content 'Hello, World!'
  end
end
