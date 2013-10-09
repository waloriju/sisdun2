require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :company_name => "MyString",
      :trading_name => "MyString",
      :cnpj => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input#company_company_name[name=?]", "company[company_name]"
      assert_select "input#company_trading_name[name=?]", "company[trading_name]"
      assert_select "input#company_cnpj[name=?]", "company[cnpj]"
    end
  end
end
