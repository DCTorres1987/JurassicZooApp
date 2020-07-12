class Feeding < ApplicationRecord
    belongs_to :dinosaur
    belongs_to :user
    validates :sustenance, presence: true
    validates :dinosaur_id, presence: true
    
end
