class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!, only: [:index, :home, :following, :followers]

	def index
		@users = User.paginate(page: params[:page])	
	end

	def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
	end

	def show
    @posts = @user.posts.paginate(page: params[:page])
	end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
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
