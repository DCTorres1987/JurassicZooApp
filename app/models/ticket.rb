class Ticket < ApplicationRecord
    belongs_to :attraction
    belongs_to :user
    validates :time, presence: true
    validates :price, presence: true


end
