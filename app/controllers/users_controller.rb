class UsersController < ApplicationController
before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
        unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
    def followings
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'

end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'

end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end


