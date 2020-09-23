class Users::BooksController < ApplicationController

  def index
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  private
  def books_params
    params.require(:book).permit(:title,:body, :author, :evaluation, :genre_id, :image, )
  end
end
