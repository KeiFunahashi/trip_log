class UsersController < ApplicationController
  
  def show
    @nickname = current_user.nickname
    @profileimg = current_user.profileimg
    @from = current_user.from
    @age = current_user.age
    @introduction = current_user.introduction
    # @posts = current_user.posts.order("time DESC")
    @posts = Post.where(user_id: current_user.id)
    # @trips = current_user.trips
    @users = User.all
  end
end

