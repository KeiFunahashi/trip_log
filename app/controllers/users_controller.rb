class UsersController < ApplicationController
  
  def show
    @nickname = current_user.nickname
    @profileimg = current_user.profileimg
    @from = current_user.from
    @age = current_user.age
    @introduction = current_user.introduction
    @posts = current_user.posts.order("time DESC")
    @users = User.all
  end
end

