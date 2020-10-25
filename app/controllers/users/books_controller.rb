class Users::BooksController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @book_comments = BookComment.where(book_id: @book.id)
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
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
