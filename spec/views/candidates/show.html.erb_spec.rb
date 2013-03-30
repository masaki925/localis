require 'spec_helper'

describe "candidates/show" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :request => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
