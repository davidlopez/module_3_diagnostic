require 'rails_helper'

describe 'As a visior when i visit the root' do
  it 'can select a house and display memebers that are orderofpheonix with info' do
    member_1 = Member.new({name: 'David', house: 'Turing', role: 'Student', patronus: 'Human'})
    member_2 = Member.new({name: 'Graham', house: 'Turing', role: 'Student'})
    member_3 = Member.new({name: 'Zac', house: 'Turing'})

    allow_any_instance_of(HouseFacade).to receive(:members).and_return([member_1, member_2, member_3])

    visit root_path
    click_button 'Search For Members'

    expect(page).to have_css(".house-member", count: 3)

    within("#0") do
      expect(page).to have_content("David")
      expect(page).to have_content("Turing")
      expect(page).to have_content("Student")
      expect(page).to have_content("Human")
    end

    within("#1") do
      expect(page).to have_content("Graham")
      expect(page).to have_content("Turing")
      expect(page).to have_content("Student")
      expect(page).to_not have_css(".patronus")
    end

    within("#2") do
      expect(page).to have_content("Zac")
      expect(page).to have_content("Turing")
      expect(page).to_not have_css(".role")
      expect(page).to_not have_css(".patronus")
    end
  end
end
