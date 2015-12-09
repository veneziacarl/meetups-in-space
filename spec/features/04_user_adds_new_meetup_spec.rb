require 'spec_helper'

feature "User adds new meetup" do
  include Seeder

  scenario "user navigates to '/new' from '/'" do
    visit '/'
    click_link('Add New Meetup!')
    expect(current_path).to eq('/new')
  end

  scenario "user is not logged in, user does not see form and sees log in prompt" do
    visit '/new'
    expect(page).to_not have_css('form')
    expect(page).to have_content('Please sign in to use this functionality')
  end

  scenario "user is logged in and fills out form" do
    seed_db
    test_user = User.find(4)
    sign_in_as(test_user)
    visit '/new'
    expect(page).to have_css('form')

    fill_in 'name', :with => 'Exercise Group'
    click_on('submit')
    expect(page).to have_content('Please fill in form completely!')
    expect(current_path).to eq('/new')

    fill_in 'name', :with => 'Exercise Group'
    fill_in 'description', :with => 'The best evar'
    click_on('submit')
    expect(page).to have_content('Please fill in form completely!')
    expect(find_field('name').value).to have_content('Exercise Group')
    expect(find_field('description').value).to have_content('The best evar')
    expect(current_path).to eq('/new')

    fill_in 'name', :with => 'Exercise Group'
    fill_in 'description', :with => 'The best evar'
    fill_in 'location', :with => 'The world is our oyster'
    click_on('submit')
    test_meetup = Meetup.where(name: 'Exercise Group').first
    expect(current_path).to eq("/meetups/#{test_meetup.id}")
    expect(page).to have_content('New meetup Exercise Group created!')
  end
end
