class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].try(:downcase))
    if user.present? && user.authenticate(params[:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = "Incorrect login"
      render :new
    end
  end

  def destroy

  end
end
