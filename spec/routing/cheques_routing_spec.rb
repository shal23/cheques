require "spec_helper"

describe ChequesController do
  describe "routing" do

    it "routes to #index" do
      get("/cheques").should route_to("cheques#index")
    end

    it "routes to #new" do
      get("/cheques/new").should route_to("cheques#new")
    end

    it "routes to #show" do
      get("/cheques/1").should route_to("cheques#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cheques/1/edit").should route_to("cheques#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cheques").should route_to("cheques#create")
    end

    it "routes to #update" do
      put("/cheques/1").should route_to("cheques#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cheques/1").should route_to("cheques#destroy", :id => "1")
    end

  end
end
