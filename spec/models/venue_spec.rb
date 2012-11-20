require 'spec_helper'

describe Venue do
  it { should validate_presence_of :name }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should have_many :flyers }

  it "returns the full name and location as a string" do
    venue = Venue.new(name: 'Bottleneck', city: 'Lawrence', state: 'KS')
    expect(venue.full_name).to eq 'Bottleneck, Lawrence KS'
  end
end
