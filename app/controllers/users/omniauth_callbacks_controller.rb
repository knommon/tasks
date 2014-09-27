class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		# @todo: implement the method below in user.rb
		@user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
		Rails.logger.debug("#{request.env['omniauth.auth']}")

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication 
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end
end
