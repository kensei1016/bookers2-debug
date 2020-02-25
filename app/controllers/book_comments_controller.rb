class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.build(set_book_comment_params)
    if @book_comment.save
      flash[:success] = "Comment was successfully created."
      render 'book_comment_view'
    else
      # エラーのときどうやってメッセージ出そう…
      render 'book_comment_view'
    end
    
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    if @book_comment.destroy
      render 'book_comments/book_comment_destroy'
    end

  end

  private

  def set_book_comment_params
    params.require(:book_comment).permit(:comment).merge(book_id: @book.id)
  end
end
