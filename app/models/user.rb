# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
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
#  admin                  :boolean          default(FALSE)
#  username               :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  fullname               :string(255)
#  public_email           :string(255)
#  organization           :string(255)
#  website                :string(255)
#  bio                    :text
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :username, :remember_me, :public_email, :organization, :website,
  				  :bio, :fullname
  
  VALID_USERNAME_REGREX = /^[A-Za-z0-9_]+$/ 
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_USERNAME_REGREX },
            length: { minimum: 2, maximum: 25 }

  EMAIL_REGREX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, format: { with: EMAIL_REGREX, message: "is not an email" }


  URL_REGREX = /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux

  validates :website, length: { maximum: 250 }, format: { with: URL_REGREX, message: "is invalid, include htpp://" }, :if => :website_present
  
  has_many :startups, dependent: :destroy
  
  has_many :invitations, dependent: :destroy
  has_many :requested_invitations, through: :invitations, source: :startup
  
  include Gravtastic
  gravtastic :size => 215,
  			 :default => "identicon",
  			 :filetype => :png

  def users_startups
    Startup.includes(:user).where(:user_id => Invitation.where(:user_id => self.id).pluck(:user_id) << self.id).order("created_at DESC")
  end

  def website_present
	website.present?
  end
  
  def request_invite!(startup)
    invitations.create!(startup_id: startup.id)
  end
  
  def requested?(startup)
    invitations.find_by_startup_id(startup.id)
  end

  def cancel_request!(startup)
  	invitations.find_by_startup_id(startup.id).destroy
  end

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  	  user.provider = auth.provider
  	  user.uid = auth.uid
  	  user.username = auth.info.nickname
  end
end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  	  new(session["devise.user_attributes"], without_protection: true) do |user|
  	  	user.attributes = params
  	  	user.valid?
  	end
   else
  	super
  end
 end

 def password_required?
	super && provider.blank?
 end

 def update_with_password(params, *options)
	if encrypted_password.blank?
	 	update_attributes(params, *options)
	else
	 super
   end
  end
end
