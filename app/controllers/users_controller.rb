class UsersController < ApplicationController

    #index page is not used but will redirect user as needed based on user login
    def index
      @users = User.search(params[:search])
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

    def new 
      # retrieves current user
      # checks if user is logged in
      # if logged in then redirects to user show page else renders new page
     
      if logged_in?
        @user = current_user         
        send_to_user_page
      
      else        
        @user = User.new
     
      end
      
    end
   

    def show         
      #checks to see if user is authorized?
        #if authorized
          #will retrieve address if there is one and save instance
          #will set current user instance variable
        #if not authorized
          #will send to 
      if user_authorized?       
        @worker = Address.find_by(user_id: params[:id])
        @user = current_user

      else 
        send_to_user_page

      end

    end 
     
    private    

    def user_authorized?
      #checks to see if user is logged in and parameter user id match
      #for user page
      @user = current_user
      logged_in? && @user.id == params[:id].to_i
    end

  
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :search)
    end
end
