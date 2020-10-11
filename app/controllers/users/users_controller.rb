class Users::UsersController < ApplicationController
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
    user.update(user_params)
    redirect_to user_path(user)
  end

  def follows
    @user = User.find(params[:id])
    #urlからUser情報を探す
    @users = @user.following_users
    #@userがもっているfollowing_userを複数探して来る
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
