require 'spec_helper'

describe "Updates" do
  let(:user) { FactoryGirl.create(:user) }
  let(:startup) { FactoryGirl.create(:startup, user: user) }
  before do
	sign_in(user)
	visit ( startup_path(startup))
  end
 
  describe "Posting an update" do
  	before do
	fill_in "Progress Update", with: "Progess"
  end
  it "should post an update" do
	expect { click_button "Post Update" }.to change(Update, :count).by(1)
   end
 end	
end
