class ProfilesController < ApplicationController
  before_action :move_to_index

  def show
    # @users = User.all
    @users = User.find(params[:id])
    @posts = Post.where(user_id:params[:id])
  end

  private
  
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end


