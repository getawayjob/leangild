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

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
  				  :username
  before_save :write_down_fullname

  before_save do
  	self.first_name.capitalize
  	self.last_name.capitalize
  end
  
  validates :first_name, :last_name, presence: true, length: { maximum: 25 }
  
  VALID_USERNAME_REGREX = /^[A-Za-z0-9_]+$/ 
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_USERNAME_REGREX },
            length: { minimum: 2, maximum: 25 }
  
  has_many :startups, dependent: :destroy
  
  has_many :invitations, dependent: :destroy
  has_many :requested_invitations, through: :invitations, source: :startup
  
  def request_invite!(startup)
    invitations.create!(startup_id: startup.id)
  end
  
  def requested?(startup)
    invitations.find_by_startup_id(startup.id)
  end

  def cancel_request!(startup)
  	invitations.find_by_startup_id(startup.id).destroy
  end
  
  private
  
  def write_down_fullname
    self.fullname = [first_name.capitalize, last_name.capitalize].join(' ')
  end
end
