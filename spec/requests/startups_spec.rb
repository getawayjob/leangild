require 'spec_helper'

describe "Startups" do
  let(:user) { FactoryGirl.create(:user) }
  let(:startup) { FactoryGirl.create(:startup, user: user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: 'wronguser@example.com', username: 'wronguser') }
  let(:submit) { "Create Startup" }
  
  describe "creating a startup" do
    before(:each) do
    sign_in(user)  
    visit new_startup_path
    end  
    describe "with invalid information" do
     it "should not create a startup" do
       expect { click_button submit }.not_to change(Startup, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name", with: "Startup"
        fill_in "Pitch", with: "Pitch"
        fill_in "Website", with: "Website"
        fill_in "Description", with: "Description"
      end
      it "should create a startup" do
        expect { click_button submit }.to change(Startup, :count).by(1)
      end
    end
  end
  
  describe "deleting a startup" do
    describe "with correct user" do
    before do
      sign_in(user)
      visit startup_path(startup)
    end
    
    it "should allow destroy" do
      expect { click_link "Destroy" }.to change(Startup, :count).by(-1)
    end
   end
   
   describe "with wrong user" do
   before do
     sign_in(wrong_user)
     visit startups_path(startup)
   end
     it { page.should_not have_link("Destroy") }
   end
  end
  
  describe "editing and updating a startup" do
    describe "with correct user" do
      before do
      	startup.save
        sign_in(user)
        visit startup_path(startup)
        click_link "Edit"
      end
        
    it { page.should have_selector('h3', text: 'Edit Startup') }
    
    describe "with valid information" do
    it "should allow update" do
      expect { click_button "Update Startup" }.not_to change(Startup, :count)
      expect { page.should have_selector('h3', text: 'Startup') }
    end
  end
  
    describe "with invalid information" do
    it "should not allow update" do
      expect { click_button "Update Startup" }.not_to change(Startup, :count)
      expect { page.should have_selector('h3', text: 'Edit Startup') }
     end
   end
 end
 
  describe "with wrong_user" do
       before do
         sign_in(wrong_user)
         visit startup_path(startup)
       end

     it { page.should_not have_link('Edit') }
     it { page.should have_selector('h3', text: 'Startup') }
    end
  end
end
