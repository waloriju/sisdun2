require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :company_name => "Company Name",
        :trading_name => "Trading Name",
        :cnpj => "Cnpj"
      ),
      stub_model(Company,
        :company_name => "Company Name",
        :trading_name => "Trading Name",
        :cnpj => "Cnpj"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Trading Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
  end
end
