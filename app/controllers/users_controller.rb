class UsersController < ApplicationController

    def new 
      # Renders signup form
      @user = current_user

      if logged_in? 
          
        redirect_to zoo_user_path(@user.zoo_id, @user.id)
      
      else 
        @user = User.new(zoo_id: params[:zoo_id])
      end

    end

    def show         
      # Displays ticket prices and zoo hours      
      @user = current_user 

      if logged_in? && @user.id == params[:id].to_i
        @user ||= User.find(params[:id])

      else 
        redirect_to zoos_path
      end
    end 

    def create
          
        @user = User.create(user_params)
        
        if @user.save
          log_in(@user)
          redirect_to zoos_path(@user.zoo_id, @user.id)
        else 
          render :new
        end 
             
    end
     
    private
  
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :zoo_id)
    end
end
