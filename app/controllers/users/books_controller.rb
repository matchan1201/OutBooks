class Users::BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(@book.user_id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(@book.user_id)
  end

  private
  def books_params
    params.require(:book).permit(:title,:body, :author, :evaluation, :genre_id, :image, )
  end
end
