require 'spec_helper'

describe "generals/index" do
  before(:each) do
    assign(:generals, [
      stub_model(General,
        :title => "Title",
        :country_code => "Country Code",
        :visa => "MyText",
        :climate => "MyText",
        :payment => "MyText",
        :annual_events => "MyText",
        :transportation => "MyText",
        :price => "MyText"
      ),
      stub_model(General,
        :title => "Title",
        :country_code => "Country Code",
        :visa => "MyText",
        :climate => "MyText",
        :payment => "MyText",
        :annual_events => "MyText",
        :transportation => "MyText",
        :price => "MyText"
      )
    ])
  end

  it "renders a list of generals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
