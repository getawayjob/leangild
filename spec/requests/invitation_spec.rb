
require "spec_helper"

describe "Invitation" do
	let(:startup) { FactoryGirl.create(:startup) }
 	let(:requester) { FactoryGirl.create(:user, email: "requester@example.com", username: "requester") }

describe "requesting an invite" do
before do
	sign_in(requester)
	visit startup_path(startup)
 end

it "should increment the startup's invitation count" do
	expect do
	 click_button "Request Invite"
	end.to change(startup.invitation_requests, :count).by(1)
  end

 it "should increment user's invitation count" do
 	expect do
 	 click_button "Request Invite"
 	end.to change(requester.requested_invitations, :count).by(1)
 end

 describe "toggling the button" do
 	before { click_button "Request Invite" }
 	it { page.should have_selector('input', value: "Cancel Request") }
 end
end

# describe "canceling a request" do
# 	before do
# 	 sign_in(requester)
# 	 visit startup_path(startup)
# 	end
# it "and canceling decrement the user invitation count" do
# 	expect do
# 		 click_button "Cancel Request"
#   	end.to change(requester.requested_invitations, :count).by(-1)
#    end

#  it "and canceling should decrement the startup invitation count" do
#  	expect do
# 		click_button "Cancel Request"
#    end.to change(startup.invitation_requests, :count).by(-1)
#  end

#  describe "and canceling toggling the button" do
# 		before { click_button "Cancel Request" }
# 		it { page.should have_selector('input', value: "Request Invite") }
#    end
#   end
 end 