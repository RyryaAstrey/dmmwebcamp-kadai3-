class UsersController < ApplicationController
  before_action :corrent_user, only: [:edit, :update]
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
  
  def update
    @user_e=User.find(params[:id])
    if @user_e.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user_e.id)
    else
      render :edit
    end
  end
  
  protected
  
  def make_book
    @book = Book.new
    @user = current_user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def corrent_user
    @user_i = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user_i==current_user
  end
end
