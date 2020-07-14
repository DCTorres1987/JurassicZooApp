class ReviewsController < ApplicationController
    before_action :require_login
    
    def index
        #retrieve all reviews
        @reviews = Review.all
    end 

    # Methods for Review Filter________
    def five_stars
        @reviews = Review.five_stars
        render :index
    end

    def four_stars
        @reviews = Review.four_stars
        render :index
    end

    def three_stars
        @reviews = Review.three_stars
        render :index
    end

    def two_stars
        @reviews = Review.two_stars
        render :index
    end

    def one_stars
        @reviews = Review.one_stars
        render :index
    end
    # _____________________________

    def show  
        redirect_if_unauthorized
        @review = Review.find_by(user_id: params[:user_id], id: params[:id])
  
    end 

    def new 
        @review = Review.new(user_id: params[:user_id]) 
    end 

    def create 
        #retrieves review by attraction id
        #if review dosent' exist create review record useing review paramss
        #if review exist it will render review show page
        #if review saves successfully it will render show page

        @review = get_review_by_attraction


        if @review.nil? 
            @review = current_user.reviews.build(review_params)
    
            if @review.save
                send_to_review_show_page

            else        
                render :new
            end 

        else
            send_to_review_show_page
        end

    end 

    def edit
        #retrieves review by review id
        @review = get_review_by_id
    end

    def update
        #retrieves review by review id
        #updates review 
        #if save it routes to review show page else render edit page
        @review = get_review_by_id 
        @review.update(review_params)
        
        if @review.save
            redirect_to user_review_path(@review.user_id,  @review.id)
        else 
            render :edit
        end

    end 

    def destroy
        @user = current_user
        @review = get_review_by_id
        @review.destroy
        redirect_to user_path(@user.id)
    end

    private

    def redirect_if_unauthorized
        redirect_to user_path(current_user.id) unless get_review_by_id
    end 

    def get_review_by_id
        #retrieve review by review id
        #to ensure only the users specific review is updated
        @review = Review.find_by(user_id: params[:user_id], id: params[:id]) 
    end


    def get_review_by_attraction
        #retrieve reviews based on attraction id
        @review = Review.find_by(user_id: params[:user_id], attraction_id: params["review"][:attraction_id])
    end

    def send_to_review_show_page
        @review = get_review_by_attraction
        redirect_to user_review_path(@review.user_id,  @review.id)
    end


    def review_params
    
        params.require(:review).permit(:stars, :review, :user_id, :attraction_id)
    end   


end
