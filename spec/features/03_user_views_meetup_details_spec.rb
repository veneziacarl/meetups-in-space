require 'spec_helper'

feature "User views meetup details page" do
  include Seeder

  scenario "user clicks meetup link on meetup index and sees details" do
    seed_db
    visit '/'
    click_on('a1')
    expect(current_path).to eq('/meetups/2')

    expect(page).to have_content('a1')
    expect(page).to have_content('meetup2')
    expect(page).to have_content('my work')
    expect(page).to have_content('queen')
  end
end
