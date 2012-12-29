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

class Invitation < ActiveRecord::Base
  attr_accessible :startup_id
  attr_accessor :quantity
  
  belongs_to :user
  belongs_to :startup
  
  validates :startup_id, :user_id, presence: true

   def send_invitation
	 self.invite_token = SecureRandom.urlsafe_base64
	 save!
	 InvitationMailer.invitation_notice(self).deliver
  end
end
