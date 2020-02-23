class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.build(book_id: @book.id)
    if favorite.save
      redirect_to @book
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    if favorite.destroy
      redirect_to @book
    end
  end
end
