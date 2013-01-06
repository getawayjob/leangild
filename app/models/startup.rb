# == Schema Information
#
# Table name: startups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  pitch      :text
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  website    :string(255)
#  tagline    :string(255)
#  deleted_at :string(255)
#

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

  URL_REGREX = /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux

  validates :website, format: { with: URL_REGREX, message: "is invalid, ensure htpp://  is included" }, :if => :website_present
    
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
	
  private 

  def website_present
  	website.present?    	
  end
end
