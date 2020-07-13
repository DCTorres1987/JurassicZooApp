class UsersController < ApplicationController

    def new 
      # retrieves current user
      # checks if user is logged in
      # if logged in then redirects to user show page else renders new page
     
      if logged_in?         
        send_to_user_page
      
      else        
        @user = User.new
     
      end
      
    end
   

    def show         
      #retrieves current user 
      #checks to see if user is logged in and matches user param
      #if not a match it will redirect to home page
      if user_check       
        @worker = Address.find_by(user_id: params[:id])
        @user = current_user

      else 
        send_to_user_page

      end

    end 

    def create
      #creates new user record by params passed in from new page      
      #if user is saved log in user and direct to home page 
      #if @user doesn't save it will render new user page

      @user = User.create(user_params)
    
      if @user.save 
        log_in(@user)
        send_to_user_page

      else       
        render :new

      end 
             
    end
     
    private    

    def user_check
      #checks to see if user is logged in and parameter user id match
      #for user page
      @user = current_user
      logged_in? && @user.id == params[:id].to_i
    end

  
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
