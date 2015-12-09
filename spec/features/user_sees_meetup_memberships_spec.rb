require 'spec_helper'

feature "User sees meetup memberships" do
  include Seeder

  scenario "user sees list of memberships" do
    seed_db

    visit '/'
    click_on('c')
    expect(current_path).to eq('/meetups/4')

    expect(page).to have_content('Member List')
    expect(page).to have_css('li')
    expect(page).to have_content('king')
    expect(page).to have_content('howudoin')
    expect(page).to have_xpath("//img[contains(@src,'http://i2.cdn.turner.com/cnnnext/dam/assets/111017060721-giant-panda-bamboo-story-top.jpg')]")
  end

end
