module SessionsHelper

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        #checks to see if user is logged in
     !!current_user
    end

end
