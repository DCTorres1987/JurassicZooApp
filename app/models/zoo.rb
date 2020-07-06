class Zoo < ApplicationRecord
    has_many :workers
    has_many :users, through: :tickets
    has_many :users, through: :reviews 
    has_many :attractions

end
