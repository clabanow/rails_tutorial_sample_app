require 'spec_helper'

describe ApplicationHelper do
	
	describe "full_title" do
		it "should include the page title" do
			expect(get_full_title("foo")).to match(/foo/)
		end

		it "should include base title" do 
			expect(get_full_title('foo')).to match(/^Ruby on Rails Tutorial Sample App/)
		end

		it "should not have a pipe in the title on the home page" do
			expect(get_full_title('')).not_to match(/\|/)
		end
	end

end