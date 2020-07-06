class Ticket < ApplicationRecord
    belongs_to :attraction
    belongs_to :user
    validates :time, presence: true
    validates :price, presence: true

    def total
        self.price.sum do |p|
        ticket.price
        end 
    end
end
