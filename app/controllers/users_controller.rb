class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!, only: [:index, :home, :following, :followers]

	def index
		@users = User.paginate(page: params[:page])	
	end

	def home
    if user_signed_in?
    end
	end

	def show
    #@posts = @user.posts.paginate(page: params[:page])
	end

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = "Successfully authenticated Google account"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

	# used in devise :sign_up and :update_account
	def self.extra_params
		:name
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

=begin
		def user_params
			params.require(:user).permit(:name, :email, :password, 
						:password_confirmation, :current_password)
		end
=end

end
