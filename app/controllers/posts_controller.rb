class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create

    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.user_id = current_user.id
    post.save

    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    post = Post.find(params[:id])
    post.title = params[:title]
    post.content = params[:content]
    post.save

    redirect_to '/'
  end

  def destroy

    post = Post.find(params[:id])
    post.destroy

    redirect_to '/'
  end
end
