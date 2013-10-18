require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :customer => nil,
      :company => nil
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_customer[name=?]", "order[customer]"
      assert_select "input#order_company[name=?]", "order[company]"
    end
  end
end
