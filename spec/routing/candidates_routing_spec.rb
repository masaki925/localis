require "spec_helper"

describe CandidatesController do
  describe "routing" do

    it "routes to #index" do
      get("/requests/1/candidates").should route_to("candidates#index", :request_id => "1")
    end

    it "routes to #new" do
      get("/requests/1/candidates/new").should route_to("candidates#new", :request_id => "1")
    end

    it "routes to #show" do
      get("/candidates/1").should route_to("candidates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/candidates/1/edit").should route_to("candidates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/requests/1/candidates").should route_to("candidates#create", :request_id => "1")
    end

    it "routes to #update" do
      put("/candidates/1").should route_to("candidates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/candidates/1").should route_to("candidates#destroy", :id => "1")
    end

  end
end
