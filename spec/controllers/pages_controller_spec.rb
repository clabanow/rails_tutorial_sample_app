require 'spec_helper'

describe PagesController do
  render_views

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(get_full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }

    it "should have a non-blank body" do
      response.body.should_not =~ /<body>\s*<\/body>/
    end

  end

  describe "Help page" do
    before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"

  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"

  end

  describe "Contact Page" do
    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
    
  end

  it "should have the correct links on the layout page" do
    visit root_path
    click_link "About"
      expect(page).to have_title(get_full_title('About'))
    click_link "Help"
      expect(page).to have_title(get_full_title('Help'))
    click_link "Contact"
      expect(page).to have_title(get_full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
      expect(page).to have_title(get_full_title('Sign up'))
    click_link "sample app"
      expect(page).to have_title(get_full_title(''))
  end

end
