class Users::BookCommentsController < ApplicationController
  def create
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    @book_comments = BookComment.where(book_id: @book.id)
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = @book.id
    unless @comment.save
      render :error
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comments = BookComment.where(book_id: @book.id)
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id] ).destroy
  end

  private
  def comment_params
    params.require(:book_comment).permit(:book_comment)
  end
end
