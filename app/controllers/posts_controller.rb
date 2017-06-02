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
    
    if post.save
      flash[:message] = '글이 작성되었습니다!'
    else
      messages = []

      post.errors.messages.each_with_index do |msg, idx|
        messages.push(msg[1][0])
      end

      @messages = messages.join('\n')
    end

    respond_to do |format|
      format.js
    end
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
