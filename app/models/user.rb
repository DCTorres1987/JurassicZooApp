class User < ApplicationRecord
    has_many :reviews   
    has_many :addresses

    has_many :feedings
    has_many :dinosaurs, through: :feedings

    has_many :tickets
    has_many :attractions, through: :tickets
    
    validates_presence_of :name, :username, :password
    validates_uniqueness_of :username
    has_secure_password

    def self.search(search)
        if search
                user = User.find_by(username: search)
                if user
                    self.where(id: user)
                else 
                    User.all
                end 
        else 
            User.all
        end
    end

end
