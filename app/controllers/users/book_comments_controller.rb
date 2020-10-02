class Users::BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book.id)
  end 

  def destroy
    book = Book.find(params[:book_id])
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id] ).destroy
    redirect_to book_path(book.id)
  end

  private
  def comment_params
    params.require(:book_comment).permit(:book_comment)
  end
end
