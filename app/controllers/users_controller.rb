class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save?
      flash[:notice] = "User #{params[:user][:name]} created!"
      redirect_to root_path
    else
      # TODO - color error classes
      render :new, status: 403
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
