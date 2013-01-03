# == Schema Information
#
# Table name: startups
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  pitch       :text
#  description :text
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  website     :string(255)
#
require 'spec_helper'

describe Startup do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @startup = user.startups.build(name: 'leangild', pitch: 'pitch', website: 'leangild.com', tagline: "tagline")
  end
  
  subject { @startup }
  
  it { should belong_to(:user) }
  it { should have_db_column(:deleted_at) }
  
  #responds_to and presence
  STARTUP_ATTR = [:name, :pitch, :tagline]
  STARTUP_ATTR.each do |attr|
    it { should respond_to(attr) }
    it { should validate_presence_of(attr) }
  end
  
  it { should respond_to(:website) }
  it { should ensure_length_of(:pitch).is_at_most(1000) }
  it { should ensure_length_of(:tagline).is_at_most(100) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:invitation_requests).through(:invitations) }
end
