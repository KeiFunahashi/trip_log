class PostsController < ApplicationController

  before_action :move_to_index, except: :index

def index
  @trip = Trip.all
  @posts = Post.all.order("time DESC").page(params[:page]).per(12)
  @news = News.all.order("created_at DESC").page(params[:page]).per(5)
  @information = Information.all.order("created_at DESC").page(params[:page]).per(5) 
end

def new
  @post = Post.new
end

def create
  Post.create(post_params)
end

def destroy
  post = Post.find(params[:id])
  post.destroy
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  @post.update(post_params)
end

def destroy
post = Post.find(params[:id])
post.destroy
end
def show
  @post = Post.find(params[:id])
end

def search
  @posts = Post.search(params[:keyword])
  respond_to do |format|
    format.html
    format.json
  end
end

private
def post_params
  params.require(:post).permit(:title, :time, :place, :image, :text).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end
