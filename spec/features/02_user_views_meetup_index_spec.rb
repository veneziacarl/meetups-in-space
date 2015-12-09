require 'spec_helper'

feature "User sees alphabetized index list of all meetups" do
  include Seeder


  scenario "user sees index list" do
    seed_db
    visit '/'
    expect(current_path).to eq('/meetups')
    expect(page).to have_content("Meetups")
    expect(page).to have_css('li')
  end

  scenario "user sees alphabetical list" do
    seed_db
    visit '/meetups'
    within "ul.display li:nth-child(1)" do
      expect(page).to have_content 'a1'
    end
    within "ul.display li:nth-child(2)" do
      expect(page).to have_content 'b2'
    end
    within "ul.display li:nth-child(3)" do
      expect(page).to have_content 'c'
    end
    within "ul.display li:nth-child(4)" do
      expect(page).to have_content 'd4'
    end
    within "ul.display li:nth-child(5)" do
      expect(page).to have_content 'e'
    end
    within "ul.display li:nth-child(6)" do
      expect(page).to have_content 'h'
    end
    within "ul.display li:nth-child(7)" do
      expect(page).to have_content 'w'
    end

  end
end
