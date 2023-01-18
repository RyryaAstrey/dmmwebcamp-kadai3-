class BooksController < ApplicationController
  before_action :make_book
  
  def index
  end

  def show
  end

  def edit
    @book_i = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end
  
  def destroy
    @book_d = Book.find(params[:id])
    @book_d.destroy
    redirect_to books_path
  end
  
  protected
  
  def make_book
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
    
end
