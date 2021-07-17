class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def edit
    @post= Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  def update
    @post = Post.find_by(id: params[;id])
    @post.content=params[:cotent]
    @post.save
    redirect_to("posts/index")
end
