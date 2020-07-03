class Attraction < ApplicationRecord
    belongs_to :zoo
    has_many :attractions, through: :worker_attractions
    has_many :tickets, through: :users
end
