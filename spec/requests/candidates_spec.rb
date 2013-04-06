require 'spec_helper'

describe "Candidates" do
  before do
    @request = FactoryGirl.create(:request)
  end

  describe "GET /requests/1/candidates" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      sign_in_as_a_user
      get request_candidates_path( request_id: @request.id )
      response.status.should be(200)
    end
  end
end
