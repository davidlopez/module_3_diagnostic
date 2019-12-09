require 'rails_helper'

describe 'As a visior when i visit the root', :vcr do
  it 'can select a house and display memebers that are orderofpheonix with info' do
    visit root_path
    click_button 'Search For Members'

    expect(page).to have_css(".house-member", count: 21)

    within(first(".house-member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".house")
      expect(page).to have_content("Gryffindor")
    end
  end
end
