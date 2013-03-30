require 'spec_helper'

describe "candidates/edit" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :request => nil,
      :user => nil
    ))
  end

  it "renders the edit candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do
      assert_select "input#candidate_request[name=?]", "candidate[request]"
      assert_select "input#candidate_user[name=?]", "candidate[user]"
    end
  end
end
