require 'spec_helper'

describe PagesController do
  render_views

  describe "Home page" do

    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have the content 'Home'" do
      visit '/pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the word 'Home' in the title" do
      visit '/pages/home'
      expect(page).to have_title('Home')
    end

    it "should have a non-blank body" do
      visit '/pages/home'
      response.body.should_not =~ //
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

    it "should have the content 'About'" do
      visit '/pages/about'
      expect(page).to have_content('About')
    end

  end

end
