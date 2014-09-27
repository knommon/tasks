class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def index
  end

  def create
    @post = current_user.tasks.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'users/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to root_url
  end

  private 
    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
