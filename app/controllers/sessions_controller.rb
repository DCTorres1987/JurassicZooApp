class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !@user
        @error = "Account not found. Please try again."
        render :new

    elsif !@user.authenticate(params[:password])
      @error = "Password Incorrect. Please try again."
      render :new

    else
      log_in(@user)
      redirect_to zoos_path(@user.zoo_id, @user.id)
    end
  end

  def destroy
    session.clear
    redirect_to zoos_path
  end
end
