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
  attr_accessible :name, :pitch, :website
  
  validates :name, :pitch, :user_id, presence: true
  validates :pitch, length: { maximum: 500 }

  validates_uniqueness_of :name, case_sensitive: false
    
  belongs_to :user
  
  has_many :invitations, dependent: :destroy
  has_many :invitation_requests, through: :invitations, source: :user

  def requested?(user)
    invitations.find_by_user_id(user.id)
  end

  include PublicActivity::Model
  tracked :owner => proc { |controller, model| controller.current_user },
  		  :params => {
  		  	:summary => proc { |controller, model| controller.truncate(model.pitch, length: 100) }
  		  }
end
