class User < ApplicationRecord
    has_many :reviews   
    has_many :tickets
    has_many :addresses

    has_many :feedings
    has_many :dinosaurs, through: :feedings

    has_many :tickets
    has_many :attractions, through: :tickets
    
    validates_presence_of :name, :email, :username, :password, :password_confirmation
    validates_uniqueness_of :username, :email
    has_secure_password

end
