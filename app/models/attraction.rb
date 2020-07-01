class Attraction < ApplicationRecord
    belongs_to :zoo
    has many :attractions, through: :worker_attractions
    has many :tickets, through: :users
end
