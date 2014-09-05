require 'spec_helper'

describe PagesController do
  render_views

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Home') }
    it { should have_title(get_full_title('')) }
    it { should_not have_title('| Home') }

    it "should have a non-blank body" do
      response.body.should_not =~ /<body>\s*<\/body>/
    end

  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(get_full_title('Help')) }

  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(get_full_title('About')) }

  end

  describe "Contact Page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(get_full_title('Contact')) }
    
  end

end
