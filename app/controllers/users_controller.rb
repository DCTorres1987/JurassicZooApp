class UsersController < ApplicationController
    def create
     
        User.create(user_params)
        @user = User.find_by(name: params[:user][:name])
        if params[:user][:password] == params[:user][:password_confirmation]
          session[:user_id] = @user.id
        else 
          redirect_to action: "new"
        end 
    end
     
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
