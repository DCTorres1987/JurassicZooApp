class Feeding < ApplicationRecord
    belongs_to :dinosaur
    belongs_to :user
end
