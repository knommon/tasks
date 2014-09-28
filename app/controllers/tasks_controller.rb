class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task_list, only: :create

  def index
  end

  def create
    @task = @task_list.tasks.build(post_params)
    #@task.user_id = current_user.id
    if @task.save
      flash[:success] = "Task created!"
      redirect_to root_url
    else
      @tasks = []
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
      params.require(:task).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

    def get_task_list
      @task_list = current_user.task_lists.find_by(id: params[:task_list_id])
      redirect_to root_url if @task_list.nil?
    end
end
