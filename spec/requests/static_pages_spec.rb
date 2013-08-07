require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Bem-vindo ao SISDUN') }
    it { should have_title(full_title('')) }
    it { should_not have_title '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About Us') }
    it { should have_title(full_title('About Us')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_title full_title('About Us')
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Home"
    #click_link "Sign up"
    #expect(page).to have_title(full_title('Sign up'))
    click_link "sisdun"
    expect(page).to have_selector 'h1', text: 'Bem-vindo ao SISDUN'
  end
end
