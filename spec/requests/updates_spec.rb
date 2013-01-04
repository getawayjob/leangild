require 'spec_helper'

describe "Updates" do
  let(:user) { FactoryGirl.create(:user) }
  let(:startup) { FactoryGirl.create(:startup, user: user) }

  #No spec written
  
  #Only the owner and admin can send updates
end
