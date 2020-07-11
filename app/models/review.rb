class Review < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
    validates :stars, presence: true
    validates :review, presence: true
    scope :five_stars, -> { where(stars: 5) }
    scope :four_stars, -> { where(stars: 4) }
    scope :three_stars, -> { where(stars: 3) }
    scope :two_stars, -> { where(stars: 2) }
    scope :one_stars, -> { where(stars: 1) }


end
