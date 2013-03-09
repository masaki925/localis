require 'spec_helper'

describe "generals/edit" do
  before(:each) do
    @general = assign(:general, stub_model(General,
      :title => "MyString",
      :country_code => "MyString",
      :visa => "MyText",
      :climate => "MyText",
      :payment => "MyText",
      :annual_events => "MyText",
      :transportation => "MyText",
      :price => "MyText"
    ))
  end

  it "renders the edit general form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", general_path(@general), "post" do
      assert_select "input#general_title[name=?]", "general[title]"
      assert_select "input#general_country_code[name=?]", "general[country_code]"
      assert_select "textarea#general_visa[name=?]", "general[visa]"
      assert_select "textarea#general_climate[name=?]", "general[climate]"
      assert_select "textarea#general_payment[name=?]", "general[payment]"
      assert_select "textarea#general_annual_events[name=?]", "general[annual_events]"
      assert_select "textarea#general_transportation[name=?]", "general[transportation]"
      assert_select "textarea#general_price[name=?]", "general[price]"
    end
  end
end
