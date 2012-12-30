require "spec_helper"

describe "Pages" do 
	let(:user) { FactoryGirl.create(:user) }

	describe "homepage" do
		before do
		 user.toggle!(:admin)
		 sign_in(user)
		 visit root_path
		end

	it { page.should have_selector('title', text: 'Create or Discover a Product') }
  end
end