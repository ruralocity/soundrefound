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
    attach_file "Image", 'spec/factories/test.jpg'
    click_button 'Create Flyer'

    page.should have_content 'Successfully created flyer.'
    page.should have_content 'Creature Comforts, Matt Wilson, Ultimate Fakebook'
    page.should have_content 'October 10, 1998'
    page.should have_content 'Bottleneck, Lawrence KS'
  end

  scenario "editing a flyer" do
    flyer = Flyer.create!(
      lineup: 'Creature Comforts, Matt Wilson, Ultimate Fakebook',
      happened_on: '1998-10-10',
      new_venue_name: 'Bottleneck',
      new_venue_city: 'Lawrence',
      new_venue_state: 'KS'      
    )

    visit flyer_url(flyer)
    click_link 'Edit'

    fill_in 'Lineup', with: 'Creature Comforts, TV Fifty'
    fill_in 'Date', with: '1999-10-10'
    within '#venue' do
      fill_in 'Name', with: 'Granada'
      fill_in 'City', with: 'Lawrence'
      fill_in 'State', with: 'Kansas'
    end
    attach_file "Image", 'spec/factories/test.jpg'
    click_button 'Update Flyer'
    
    page.should have_content 'Successfully updated flyer.'
    page.should have_content 'Creature Comforts, TV Fifty'
    page.should have_content 'October 10, 1999'
    page.should have_content 'Granada, Lawrence Kansas'
  end
end