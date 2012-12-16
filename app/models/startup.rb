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
  attr_accessible :description, :name, :pitch, :website, :user_id, as: :admin
      
  validates :description, :name, :pitch, :user_id, presence: true
  validates :pitch, length: { maximum: 500 }
  validates :description, length: { maximum: 3000 }
    
  belongs_to :user
end
