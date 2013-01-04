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
class Startup < ActiveRecord::Base
  attr_accessible :name, :pitch, :website, :tagline
  
  validates :name, :pitch, :user_id, :tagline, presence: true
  validates :pitch, length: { maximum: 1000 }
  validates :tagline, length: { maximum: 100 }

  validates_uniqueness_of :name, case_sensitive: false
    
  #startup should be owned by user
  belongs_to :user
  
  #soft delete
  acts_as_paranoid

  #invitation associations
  has_many :invitations, dependent: :destroy
  has_many :invitation_requests, through: :invitations, source: :user
	
  #startup association
  has_many :updates, dependent: :destroy

  #has startup been requested by user
  def requested?(user)
    invitations.find_by_user_id(user.id)
  end
end
