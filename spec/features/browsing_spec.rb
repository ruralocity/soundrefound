require 'spec_helper'

feature "browsing the site" do
  let(:spoon_graceland_flyer) {
    FactoryGirl.create(:flyer,
      lineup: 'Spoon, The Oranges, Treasure State',
      happened_on: '2002-10-19',
      new_venue_name: 'Graceland',
      new_venue_city: 'Seattle',
      new_venue_state: 'WA',
      notes: 'A great show at the Graceland.')
  }
  let(:neko_neumos_flyer) {
    FactoryGirl.create(:flyer,
      lineup: 'Neko Case, The Sadies',
      happened_on: '2004-11-27',
      new_venue_name: 'Neumos',
      new_venue_city: 'Seattle',
      new_venue_state: 'WA',
      notes: 'A fine show at Neumos.')
  }

  before :all do
    spoon_graceland_flyer
    neko_neumos_flyer
  end

  after :all do
    Venue.destroy_all
    Band.destroy_all
    Flyer.destroy_all
  end

  scenario "browsing all flyers" do
    visit root_url

    expect(page).to have_content 'Spoon, The Oranges, Treasure State'
    expect(page).to have_content 'Graceland, Seattle WA'
    expect(page).to have_content 'October 19, 2002'
    expect(page).to have_xpath("//img[@src='#{spoon_graceland_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A great show at the Graceland.'

    expect(page).to have_content 'Neko Case, The Sadies'
    expect(page).to have_content 'Neumos, Seattle WA'
    expect(page).to have_content 'November 27, 2004'
    expect(page).to have_xpath("//img[@src='#{neko_neumos_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A fine show at Neumos.'
  end
  
  scenario "browsing by band" do
    visit root_url
    click_link 'By Band'
    click_link 'Spoon'

    expect(page).to have_content 'Spoon, The Oranges, Treasure State'
    expect(page).to have_content 'Graceland, Seattle WA'
    expect(page).to have_content 'October 19, 2002'
    expect(page).to have_xpath("//img[@src='#{spoon_graceland_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A great show at the Graceland.'

    expect(page).to_not have_content 'Neko Case, The Sadies'
    expect(page).to_not have_content 'Neumos, Seattle WA'
    expect(page).to_not have_content 'November 27, 2004'
    expect(page).to_not have_xpath("//img[@src='#{neko_neumos_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A fine show at Neumos.'
  end

  scenario "browsing by venue" do
    visit root_url
    click_link 'By Venue'
    click_link 'Neumos, Seattle WA'

    expect(page).to_not have_content 'Spoon, The Oranges, Treasure State'
    expect(page).to_not have_content 'Graceland, Seattle WA'
    expect(page).to_not have_content 'October 19, 2002'
    expect(page).to_not have_xpath("//img[@src='#{spoon_graceland_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A great show at the Graceland.'

    expect(page).to have_content 'Neko Case, The Sadies'
    expect(page).to have_content 'Neumos, Seattle WA'
    expect(page).to have_content 'November 27, 2004'
    expect(page).to have_xpath("//img[@src='#{neko_neumos_flyer.image_url(:thumb)}']")
    expect(page).to_not have_content 'A fine show at Neumos.'
  end

  scenario "viewing an individual flyer" do
    visit root_url
    click_link spoon_graceland_flyer.band_list
    
    expect(page).to have_content 'Spoon, The Oranges, Treasure State'
    expect(page).to have_content 'October 19, 2002'
    expect(page).to have_content 'Graceland, Seattle WA'
    expect(page).to have_content 'A great show at the Graceland.'
    expect(page).to have_xpath("//img[@src='#{spoon_graceland_flyer.image_url(:medium)}']")
    expect(page).to_not have_content 'Edit'
  end
end