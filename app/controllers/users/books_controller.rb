class Users::BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @book_comments = BookComment.all
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to book_path(@book)
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
