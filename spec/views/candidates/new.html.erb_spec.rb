require 'spec_helper'

describe "candidates/new" do
  before(:each) do
    assign(:candidate, stub_model(Candidate,
      :request => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", candidates_path, "post" do
      assert_select "input#candidate_request[name=?]", "candidate[request]"
      assert_select "input#candidate_user[name=?]", "candidate[user]"
    end
  end
end
