require "spec_helper"

describe FailsController do
  describe "routing" do

    it "routes to #index" do
      get("/fails").should route_to("fails#index")
    end

    it "routes to #new" do
      get("/fails/new").should route_to("fails#new")
    end

    it "routes to #show" do
      get("/fails/1").should route_to("fails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fails/1/edit").should route_to("fails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fails").should route_to("fails#create")
    end

    it "routes to #update" do
      put("/fails/1").should route_to("fails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fails/1").should route_to("fails#destroy", :id => "1")
    end

  end
end
