class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.build(set_book_comment_params)
    if @book_comment.save
      redirect_to book_path(@book), notice: "コメントを投稿しました"
    else
      @book_comments = BookComment.where(user_id: current_user.id)
      render "books/show"
    end
  end

  def destroy
  end

  private

  def set_book_comment_params
    params.require(:book_comment).permit(:comment).merge(book_id: @book.id)
  end
end
