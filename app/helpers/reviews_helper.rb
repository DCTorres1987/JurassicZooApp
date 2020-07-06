module ReviewsHelper
    def rating
        star_rating = [1, 2, 3, 4, 5]
    end 

    def number_of_reviews
        @reviews = Review.all
        @reviews.count
    end
end
