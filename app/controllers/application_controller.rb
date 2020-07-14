class ApplicationController < ActionController::Base

    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        #require login before access
        redirect_to zoos_path unless logged_in?
    end

    def logged_in?
        #checks to see if user is logged in
     !!current_user
    end

    def log_in(user)
        #login user
        # used in sessions controller
        session[:user_id] = user.id
    end

    def send_to_login
        #redirects to login page
        redirect_to login_path
    end

    def find_zoo
        #finds zoo using id
        @zoo = Zoo.find_by(id: params[:id])
        !!@zoo
    end

    def zoo_exist?
        #if zoo doesn't it redirects to homepage
        redirect_to zoos_path unless find_zoo
    end

    def send_to_home_page
        #redirects to homepage
       redirect_to zoos_path
    end

    def send_to_user_page
        #send to user page
        if logged_in?
            @user = current_user
            redirect_to user_path(@user.id)
        else 
            send_to_home_page
        end
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
