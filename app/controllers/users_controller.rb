class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user=User.new(name: params[:name])
    @user.save
    redirect_to("/users/#{@user.id}")
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
