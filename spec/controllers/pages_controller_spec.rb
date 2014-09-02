require 'spec_helper'

describe PagesController do
  render_views

  describe "Home page" do

    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have the content 'Sample App'" do
      visit '/pages/home'
      expect(page).to have_content('Sample App')
    end

  end

  describe "Help page" do
    
    it "should have the content 'Help'" do
      visit '/pages/help'
      expect(page).to have_content('Help')
    end

  end

  describe "About page" do

    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have the content 'About Us'" do
      visit '/pages/about'
      expect(page).to have_content('About Us')
    end

  end

end
