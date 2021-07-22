class UsersController < ApplicationController
before_action :set_current_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def login_form
  end

  def login
  @user= User.find_by(password: params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/posts/index")
    else
      render("users/login_form")
    end
  end

  def logout
     session[:user_id] = nil
     flash[:notice]="ログアウトしました"
     redirect_to("/login")
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password]
    )
    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
