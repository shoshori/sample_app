class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new(content: params[:content])
  end

  def edit
    @post= Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice]="投稿に成功しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content=params[:content]
    if @post.save
      flash[:notice]="投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to("/posts/index")
  end
end
