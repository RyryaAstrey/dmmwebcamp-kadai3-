class BooksController < ApplicationController
  before_action :make_book
  
  def index
    @user = current_user
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to books_path
  end
  
  protected
  
  def make_book
    @book = Book.new
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
    
end
