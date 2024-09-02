class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user_info_index = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @user_book = Book.find(params[:id])
    @user = @user_book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash.discard(:notice)
      @book = Book.all
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book. update (book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      flash.discard(:notice)
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book. destroy
      flash[:notice] = "Book was successfully created."
      redirect_to books_url
    else
      flash.discard(:notice)
      redirect_to '/books'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
