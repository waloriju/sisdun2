require 'spec_helper'

describe Customer do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @customer }

  it { shold respond_to(:name) }
  it { shold respond_to(:email) }
  it { shold respond_to(:cpf) }
  it { shold respond_to(:phone) }
