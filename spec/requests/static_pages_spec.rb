require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

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

  	it "should have the content 'About Us'" do
  	  visit '/pages/about'
  	  expect(page).to have_content('About Us')
  	end
  end


end
