class Invitation < ActiveRecord::Base
  attr_accessible :startup_id
  
  belongs_to :user
  belongs_to :startup
  
  validates :startup_id, :user_id, presence: true
end
