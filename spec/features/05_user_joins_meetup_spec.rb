require 'spec_helper'

feature "User joins meetup" do
  include Seeder

  scenario "user sees button to join if not signed in and recieves message on click" do
    seed_db
    visit '/'
    click_on('c')
    expect(current_path).to eq('/meetups/4')

    click_on('JOIN MEETUP')
    expect(page).to have_content("Please sign in to join this meetup!")
  end

  scenario "user clicks button to join if signed in but not a member" do
    seed_db
    test_user = User.find(3)
    sign_in_as(test_user)

    visit '/'
    click_on('c')
    expect(current_path).to eq('/meetups/4')

    click_on('JOIN MEETUP')
    expect(current_path).to eq('/meetups/4')
    expect(page).to have_content('user: beefsteak')
  end

  # scenario "user sees button to join if not signed in" do
  #   seed_db
  #   visit '/'
  #   click_on('a1')
  #   expect(current_path).to eq('/meetups/2')
  #
  #   expect(page).to have_content('a1')
  #   expect(page).to have_content('meetup2')
  #   expect(page).to have_content('my work')
  #   expect(page).to have_content('queen')
  # end
end
