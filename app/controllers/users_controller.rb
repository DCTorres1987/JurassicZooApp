class UsersController < ApplicationController

    def new 
      
      @user = User.new(zoo_id: params[:zoo_id])
    end

    def show 
      @user ||= User.find(params[:id])
    end 

    def login
    end

    def create
          
        @user = User.create(user_params)
        if @user.save
          redirect_to zoo_user_path(@user.zoo_id, @user.id)
        else 
          render :new
        end 
             
    end
     
    private
  
    def user_params
        params.require(:user).permit(:name, :username, :email, :password_digest, :zoo_id)
    end
end
