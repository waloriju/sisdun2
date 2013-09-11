require 'spec_helper'

describe Customer do

  before do
    @customer = Customer.new(first_name: "Example", last_name: "User", gender: "male", cpf: "22406513858", birth_date: "1995-07-12")
  end

  subject { @customer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }
  it { should respond_to(:cpf) }
  it { should respond_to(:birth_date) }

  it { should be_valid }
  
  describe "when first name is not present" do
    before { @customer.first_name = " " }
    it { should_not be_valid}
  end

  describe "when last name is not present" do
    before { @customer.last_name = " " }
    it { should_not be_valid}
  end

  describe "when gender is not present" do
    before { @customer.gender = " " }
    it { should_not be_valid}
  end

  describe "when cpf is not present" do
    before { @customer.cpf = " " }
    it { should_not be_valid }
  end

  describe "when birth date is not present" do
    before { @customer.birth_date = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @customer.first_name = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @customer.last_name = "a" * 71 }
    it { should_not be_valid }
  end

  describe "when gender name is valid" do
    it "should be valid" do
      gender = %w[male female]
      gender.each do |valid_gender|
        @customer.gender = valid_gender
        expect(@customer).to be_valid
      end
    end
  end

  describe "when cpf is too long" do
    before { @customer.cpf = "1" * 12 }
    it { should_not be_valid }
  end

  describe "when cpf is too short" do
    before { @customer.cpf = "1" * 10 }
    it { should_not be_valid }
  end

  describe "when cpf is already taken" do
    before do
      customer_with_same_cpf = @customer.dup
      customer_with_same_cpf.cpf = @customer.cpf
      customer_with_same_cpf.save
    end

    it { should_not be_valid }
  end
end