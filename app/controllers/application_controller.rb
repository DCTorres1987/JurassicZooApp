class ApplicationController < ActionController::Base

    def find_zoo
        #finds zoo using id
        #returns true if zoo exists
        @zoo = Zoo.find_by(id: params[:id])
        !!@zoo
    end

    #if zoo doesn't exists redirects to homepage
    def zoo_exist?        
        redirect_to zoos_path unless find_zoo
    end

    #retrieves user currently logged in
    def current_user
        User.find_by(id: session[:user_id])
    end

    #checks to see if user is logged in
    def logged_in?        
        !!current_user
    end

    #saves users session
    def log_in(user)
        #login user
        # used in sessions controller
        session[:user_id] = user.id
    end

    def send_to_user_page
        #send to user page
        @user = current_user
        redirect_to user_path(@user.id) unless require_login
    end 

    def require_login
        #require login before access
        redirect_to zoos_path unless logged_in?
    end

    def send_to_login
        #redirects to login page
        redirect_to login_path
    end


    def send_to_home_page
        #redirects to homepage
       redirect_to zoos_path
    end



    def user_check
        #checks to see if user is logged in and parameter user id match
        #not for user page
        if logged_in?
            @user = current_user
            logged_in? && @user.id == params[:user_id].to_i
        else 
            send_to_home_page
        end
    end

end
