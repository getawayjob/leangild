require "spec_helper"

describe "Invitation" do
	let(:user) { FactoryGirl.create(:user) }
	let(:startup) { FactoryGirl.create(:startup, user: user) }
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
 	it { page.should have_selector('button', text: "Cancel Request") }
  end
 end

 describe "requesting an invitation" do
	before do
	 sign_in(requester)
	 visit startup_path(startup)
	 click_button "Request Invite"
   end

 #  describe "and sending an invitation" do
 #   	before do
 #   	  requester.toggle!(:admin)
	#   visit startup_path(startup)
	#   click_button "Send Invitations"
 #   	end
	# it { startup.invitations.first.invite_token.should_not == nil }
 #   end
  end

  describe "canceling a request" do
	before do
	 sign_in(requester)
	 visit startup_path(startup)
	 click_button "Request Invite"
	end

 it "should decrement the user invitation count" do
	expect do
		 click_button "Cancel Request"
  	end.to change(requester.requested_invitations, :count).by(-1)
   end

 it "should decrement the startup invitation count" do
 	expect do
		click_button "Cancel Request"
   end.to change(startup.invitation_requests, :count).by(-1)
 end

 describe "and canceling toggling the button" do
		before { click_button "Cancel Request" }
		it { page.should have_selector('button', text: "Request Invite") }
   end
  end
 end