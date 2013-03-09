require "spec_helper"

describe GeneralsController do
  describe "routing" do

    it "routes to #index" do
      get("/generals").should route_to("generals#index")
    end

    it "routes to #new" do
      get("/generals/new").should route_to("generals#new")
    end

    it "routes to #show" do
      get("/generals/1").should route_to("generals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/generals/1/edit").should route_to("generals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/generals").should route_to("generals#create")
    end

    it "routes to #update" do
      put("/generals/1").should route_to("generals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/generals/1").should route_to("generals#destroy", :id => "1")
    end

  end
end
