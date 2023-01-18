class UsersController < ApplicationController
  before_action :make_book
  
  def index
    
  end

  def show
    @books = Book.all
  end

  def edit
  end
  
  protected
  
  def make_book
    @book = Book.new
    @user = current_user
  end
end
