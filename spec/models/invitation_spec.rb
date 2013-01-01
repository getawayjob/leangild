# == Schema Information
#
# Table name: invitations
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  startup_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  invite_token :string(255)
#

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
  it { should_not allow_mass_assignment_of(:invite_token) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:startup_id) }

  it { should respond_to(:send_invitation) }
end
