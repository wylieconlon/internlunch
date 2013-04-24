class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable
	devise :database_authenticatable, :registerable, :omniauthable,
			:recoverable, :rememberable, :trackable, :validatable

	serialize :Facebook

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :living_location, :work_location, :Facebook, :name, :username
	# attr_accessible :title, :body
	
	has_one :company

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.username = data["username"]
				user.name = data["name"]
				user.email = data["email"]
			end
		end
	end

	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token.extra.raw_info
		if user = self.find_by_email(data.email)
			user
		else # Create a user with a stub password. 
			self.create(:email => data.email, :password => Devise.friendly_token[0,20]) 
		end
	end
end
