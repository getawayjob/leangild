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
  attr_accessible :description, :name, :pitch, :website
  
  belongs_to :user
    
  validates :description, :name, :pitch, :user_id, presence: true
  validates :pitch, length: { maximum: 500 }
  validates :description, length: { maximum: 3000 }
end
