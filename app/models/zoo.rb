class Zoo < ApplicationRecord
    has_many :workers
    has_many :users, through: :tickets
    has_many :reviews, through: :users
    
end
