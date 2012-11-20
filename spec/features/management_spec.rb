require 'spec_helper'

feature "flyer management" do
  scenario "adding a flyer" do
    visit root_url
    click_link 'New Flyer'

    fill_in 'Lineup', with: 'Creature Comforts, Matt Wilson, Ultimate Fakebook'
    fill_in 'Date', with: '1998-10-10'
    within '#venue' do
      fill_in 'Name', with: 'Bottleneck'
      fill_in 'City', with: 'Lawrence'
      fill_in 'State', with: 'KS'
    end
    # upload file
    click_button 'Create Flyer'

    page.should have_content 'Successfully created flyer.'
    page.should have_content 'Creature Comforts, Matt Wilson, Ultimate Fakebook'
    page.should have_content 'October 10, 1998'
    page.should have_content 'Bottleneck, Lawrence KS'
  end

  scenario "editing a flyer" do
  end
end