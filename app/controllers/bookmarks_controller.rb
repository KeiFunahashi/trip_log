class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @user = User.find(current_user.id)
  end
  
  def create
    user=current_user
    post=Post.find(params[:post_id])
    if Bookmark.create(user_id: user.id,post_id:post.id)
    redirect_to post
    else
      redirect_to root_url
    end

  end

  def destroy
    user=current_user
    post=Post.find(params[:post_id])
    if bookmark=Bookmark.find_by(user_id: user.id,post_id:post.id)
      bookmark.delete
      redirect_to post
    else
      redirect_to root_url
    end
end
end