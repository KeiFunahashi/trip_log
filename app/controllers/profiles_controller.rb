class ProfilesController < ApplicationController
  def show
    # @users = User.all
    @users = User.find(params[:id])
    @posts = Post.where(user_id:params[:id])
  end
end


