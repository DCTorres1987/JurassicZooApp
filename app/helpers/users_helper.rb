module UsersHelper

    def number_of_visitors
        @users = User.all
        @users.count
    end

end
