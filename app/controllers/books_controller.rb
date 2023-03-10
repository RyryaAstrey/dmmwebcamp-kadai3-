class BooksController < ApplicationController
  before_action :corrent_user, only: [:edit, :update]
  before_action :make_book, only: [:index, :show, :edit]
  
  def index
  end

  def show
    @book_i = Book.find(params[:id])
  end

  def edit
    @book_i = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  
  def update
    @book_i=Book.find(params[:id])
    if @book_i.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    @book_i = Book.find(params[:id])
    @book_i.destroy
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
  
  def corrent_user
    @book_id = Book.find(params[:id])
    @user_id=@book_id.user
    redirect_to(books_path) unless @user_id==current_user
  end
    
end
