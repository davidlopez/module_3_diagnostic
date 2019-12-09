require 'rails_helper'

describe 'As a visior when i visit the root' do
  it 'can select a house and display memebers that are orderofpheonix with info' do
    visit root_path
    click_button 'Search For Members'

    expect(page).to have_css(".house_member", count: 21)

    expect(page).to have_content

    within(first(".house_member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end
  end
end

# Endpoint documentation: https://www.potterapi.com/
# We will be using the /characters  route
# User Story:
# As a user,
# When I visit "/"
# And I Select "Gryffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (21 for Gryffindor)
# Then I should see a list of 21 members
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
