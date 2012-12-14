require 'spec_helper'

describe "UserPages" do
  describe "Sign up" do
    before { visit signup_path }
    let(:submit) { "Sign Up" }
    
    describe "proper signup process" do
      before do
        fill_in "First name", with: "Firstname"
        fill_in "Last name", with: "Lastname"
        fill_in "Username", with: "Username"
        fill_in "Email", with: "email@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end 
    it "should create a user" do
      expect { click_button submit }.to change(User, :count).by(1)
      end
    end
     
  describe "improper signup process" do
    it "should not create a user" do
      expect { click_button submit }.not_to change(User, :count)
    end
  end
 end
 
 describe "Sign in" do
   let(:user) { FactoryGirl.create(:user) }
   before { visit signin_path }
   let(:submit) { "Sign In" }

  describe "proper signin process" do
    before do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button submit
    end
  it { should have_selector('title', text: user.username) }
  end
 end
end
