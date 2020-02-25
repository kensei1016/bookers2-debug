class SearchController < ApplicationController
  def search
    @keyword = params[:search][:keyword]
    @search_model_name = params[:search][:search_model_name]
    @search_type = params[:search][:search_type]

    if @search_model_name == 'User'
      @users = User.search(@keyword, @search_type)     

      @user = current_user
      @book = Book.new
      render "users/index"

    elsif @search_model_name == 'Book'
      @books = Book.search(@keyword, @search_type)   

      @book = Book.new
      render "books/index"
    else
    end

    

    
  end
end
