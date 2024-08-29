class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @books_user = Book.where(user_id: @user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.discard(:notice)
      @books = Book.all
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book. update (book_params)
      flash[:notice] = "Book was successfully created."
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
end
