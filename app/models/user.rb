class User < ActiveRecord::Base
	has_many :tasks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
				 :confirmable, :lockable,
				 :omniauthable, :omniauth_providers => [:google_oauth2]

	enum provider: [:google]

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end

	def self.find_for_google_oauth2(auth)
		where(auth.slice(:provider, :uid)).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name || user.email.split('@')[0]
			user.image = auth.info.image
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.skip_confirmation! if auth.info.verified
		end
	end
end
