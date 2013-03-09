require 'spec_helper'

describe "generals/show" do
  before(:each) do
    @general = assign(:general, stub_model(General,
      :title => "Title",
      :country_code => "Country Code",
      :visa => "MyText",
      :climate => "MyText",
      :payment => "MyText",
      :annual_events => "MyText",
      :transportation => "MyText",
      :price => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Country Code/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
