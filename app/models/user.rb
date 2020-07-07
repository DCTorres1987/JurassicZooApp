class User < ApplicationRecord
    belongs_to :zoo
    has_many :reviews    
    validates_presence_of :name, :email, :username, :password, :password_confirmation
    validates_uniqueness_of :username, :email
    has_secure_password

end
