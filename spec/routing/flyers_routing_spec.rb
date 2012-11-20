require "spec_helper"

describe FlyersController do
  describe "routing" do

    it "routes to #index" do
      get("/flyers").should route_to("flyers#index")
    end

    it "routes to #new" do
      get("/flyers/new").should route_to("flyers#new")
    end

    it "routes to #show" do
      get("/flyers/1").should route_to("flyers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flyers/1/edit").should route_to("flyers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flyers").should route_to("flyers#create")
    end

    it "routes to #update" do
      put("/flyers/1").should route_to("flyers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flyers/1").should route_to("flyers#destroy", :id => "1")
    end

  end
end
