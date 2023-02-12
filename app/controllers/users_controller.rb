class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
     @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @userbooks = @user.books
  end



  def edit
    @user = User.find(params[:id])
  end

end