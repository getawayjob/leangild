require "spec_helper"

describe "Pages" do 
	let(:user) { FactoryGirl.create(:user) }

	describe "homepage" do
		before do
		 sign_in(user)
		 visit root_path
		end

	it { page.should have_selector('title', text: 'All Startups') }
  end
end