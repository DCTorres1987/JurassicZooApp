class Attraction < ApplicationRecord
    belongs_to :zoo
    has_many :tickets

   
end
