class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create

    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.username = params[:username]
    post.save

    redirect_to '/'
  end
end
