require 'spec_helper'

describe Flyer do
  it { should validate_presence_of :happened_on }
  it { should belong_to :venue }
  it { should have_and_belong_to_many :bands }

  # let(:venue) { mock_model(Venue) }
  let(:venue) {
    FactoryGirl.create(:venue,
      name: 'Bottleneck',
      city: 'Lawrence',
      state: 'KS')
  }
  let(:flyer) {
    Flyer.new(
      lineup: 'Guided by Voices, Breeders',
      happened_on: '2010-10-10',
      venue_id: venue.id)
  }
  
  describe 'lineup creation' do
    it "creates a lineup from a comma-separated list of bands" do
      flyer.save
      flyer.reload
      expect(flyer.bands.count).to eq 2
    end

    it "does not create a band that already exists" do
      gbv = Band.create(name: 'Guided by Voices')
      expect {
        flyer.save
        flyer.reload
      }.to change(Band, :count).by(1)
    end
    
    it "strips whitespace from the band's name" do
      flyer.lineup = ' Guided by Voices , Breeders'
      flyer.save
      flyer.reload
      expect(flyer.bands.first.name).to eq 'Breeders'
      expect(flyer.bands.last.name).to eq 'Guided by Voices'
    end
  end
  
  it "returns a list of band names" do
    flyer.save
    flyer.reload
    expect(flyer.band_list).to eq 'Breeders, Guided by Voices'
  end
  
  it "returns a full description of the band list, venue and date" do
    flyer.save
    flyer.reload
    expect(flyer.full_description).to eq 'Breeders, Guided by Voices, Bottleneck, Lawrence KS, October 10, 2010'
  end
  
  it "does not duplicate band associations when saving" do
    flyer.lineup = 'Guided by Voices, Breeders, Guided by Voices'
    flyer.save
    flyer.reload
    expect(flyer.band_list).to eq 'Breeders, Guided by Voices'
  end
  
  it "does not erase band associations if none are provided on update" do
    flyer.update_attributes({happened_on: 2.days.ago})
    flyer.save
    flyer.reload
    expect(flyer.band_list).to eq 'Breeders, Guided by Voices'
  end
end
