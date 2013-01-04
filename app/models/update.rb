class Update < ActiveRecord::Base
  attr_accessible :content, :startup_id

  belongs_to :startup

  validates :content, :startup_id, presence: true 
  validates :content, length: { maximum: 250 }

  default_scope order: 'updates.created_at DESC'
end
