require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :company_name => "MyString",
      :trading_name => "MyString",
      :cnpj => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_company_name[name=?]", "company[company_name]"
      assert_select "input#company_trading_name[name=?]", "company[trading_name]"
      assert_select "input#company_cnpj[name=?]", "company[cnpj]"
    end
  end
end
