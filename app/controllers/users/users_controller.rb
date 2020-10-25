class Users::UsersController < ApplicationController
  before_action :authenticate_user!,only: [:edit,:update,:index,:show,:follows,:followers]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
