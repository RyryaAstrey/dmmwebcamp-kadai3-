class UsersController < ApplicationController
  before_action :make_book
  
  def index
    @users=User.all
  end

  def show
    @user_i=User.find(params[:id])
    @book_opinions = @user_i.books
  end

  def edit
    @user_e = User.find(params[:id])
  end
  
  protected
  
  def make_book
    @book = Book.new
    @user = current_user
  end
end
