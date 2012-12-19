require 'spec_helper'

describe Invitation do
  let(:user) { FactoryGirl.create(:user) }
  let(:startup) { FactoryGirl.create(:startup, user: user) }
  let(:invitation) { user.invitations.build(startup_id: startup.id) }
  
  subject { invitation }
  
  it { should be_valid }
  
  it { should belong_to(:user) }
  it { should belong_to(:startup) }
  
  it { should_not allow_mass_assignment_of(:user_id) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:startup_id) }
end
