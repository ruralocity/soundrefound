require 'spec_helper'

describe VenuesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      venue = mock_model(Venue)
      venue.stub(:save).and_return(true)
      Venue.stub(:find).and_return(venue.id)
      get 'show', id: venue
      response.should be_success
    end
  end

end
