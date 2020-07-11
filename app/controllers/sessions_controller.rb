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
        send_to_user_page
    end
  end

  def destroy
    session.clear
    send_to_home_page
  end
end
