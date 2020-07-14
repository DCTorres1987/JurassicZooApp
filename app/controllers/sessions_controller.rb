class SessionsController < ApplicationController

  def new
  end

  def create
 
      # if a user logged in with omniauth (how can we tell?) 
      if request.env["omniauth.auth"]
          #then find or create them in the db by uid
          @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
        
          if @user.nil?  
            @user = User.create(name: request.env["omniauth.auth"]["info"]["name"], username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")
          end

          log_in(@user)
          send_to_user_page
      else
          # locally authenticate the user - verify they exist in the db by username
          # and that their password matches what is in the db
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
  end

  def destroy
    session.clear
    send_to_home_page
  end
  
end
