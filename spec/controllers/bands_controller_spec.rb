require 'spec_helper'

describe BandsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      band = mock_model(Band)
      band.stub(:save).and_return(true)
      Band.stub(:find).and_return(band.id)
      get 'show', id: band
      response.should be_success
    end
  end

end
