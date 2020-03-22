
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def new
  	  @book = Book.new
  end
  def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books
  end

  def index
  	  @user = current_user
  	  @users = User.all
      @book = Book.new

  end
  def update
      @user = User.find(params[:id])

      if @user.update(user_params)
         flash[:notice] = "You have update user successfully"
         redirect_to user_path(@user.id)
      else
         render ("users/edit")
      end
  end

  def edit
  	  @user = current_user
  end
  



  private
  def correct_user
       user = User.find(params[:id])
    if current_user != user
       redirect_to user_path(current_user)
    end
    # redirect_to books_path if current_user != user
  end
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end