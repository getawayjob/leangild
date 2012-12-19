# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  fullname               :string(255)
#

require 'spec_helper'

describe User do
  before do
    @user = User.create!(first_name: "Firstname", last_name: "Lastname", username: "username", email: "username@example.com", password: "password", password_confirmation: "password")
  end
  
  subject { @user }
  
  #responds_to, allow_mass_assignment attr
  USER_ATTRS = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
  USER_ATTRS.each do |attr|
    it { should respond_to(attr) }
    it { should allow_mass_assignment_of(attr) }
  end
  
  #validate presence
  PRESENT_ATTRS = [:first_name, :last_name, :username]
  PRESENT_ATTRS.each do |attr|
    it { should validate_presence_of(attr)}
  end
  
  #validate uniqueness and format and length of username
  it { should validate_uniqueness_of(:username).case_insensitive }
  USERNAME_REGREX = /^[A-Za-z0-9_]+$/
  it { should validate_format_of(:username).with('USERNAME_REGREX') }
  it { should ensure_length_of(:username).is_at_least(2).with_message(:too_short) }
  it { should ensure_length_of(:username).is_at_most(25).with_message(:too_long) }
  
  #valiadate length of first_name and last_name
  NAMES = [:last_name, :first_name]
  NAMES.each do |name|
    it { should ensure_length_of(name).is_at_most(25).with_message(:too_long) }
  end
  
  it { should have_many(:startups).dependent(:destroy) }
  
  it { should have_many(:invitations) }
  it { should have_many(:requested_invitations).through(:invitations) }
  
  it { should respond_to(:invitations) }
  it { should respond_to(:requested_invitations) }
  
  it { should respond_to(:request_invite!) }
  
  let(:startup) { FactoryGirl.create(:startup, user: @user) }
  let(:requester) { FactoryGirl.create(:user, email: "requester@example.com", username: "requester") }
  
  describe "request invite" do
    before do
      requester.request_invite!(startup)
    end
   
    it { should be_valid }
    
    it { requester.should be_requested(startup) }
    it { startup.should be_requested(requester) }

    it { requester.requested_invitations.should include(startup) }
    it { startup.invitation_requests.should include(requester) }
  end
end
