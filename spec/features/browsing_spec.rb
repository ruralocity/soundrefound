require 'spec_helper'

feature "browsing the site" do
  let(:spoon_graceland_flyer) {
    Flyer.create!(
      lineup: 'Spoon, The Oranges, Treasure State',
      happened_on: '2002-10-19',
      new_venue_name: 'Graceland',
      new_venue_city: 'Seattle',
      new_venue_state: 'WA')
  }
  let(:neko_neumos_flyer) {
    Flyer.create!(
      lineup: 'Neko Case, The Sadies',
      happened_on: '2004-11-27',
      new_venue_name: 'Neumos',
      new_venue_city: 'Seattle',
      new_venue_state: 'WA')
  }

  before :each do
    spoon_graceland_flyer
    neko_neumos_flyer
  end

  scenario "browsing all flyers" do
    visit root_url

    page.should have_content 'Spoon, The Oranges, Treasure State'
    page.should have_content 'Graceland, Seattle WA'
    page.should have_content 'October 19, 2002'

    page.should have_content 'Neko Case, The Sadies'
    page.should have_content 'Neumos, Seattle WA'
    page.should have_content 'November 27, 2004'
  end
  
  scenario "browsing by band" do
  end

  scenario "browsing by venue" do
  end

  scenario "viewing an individual flyer" do
  end
end