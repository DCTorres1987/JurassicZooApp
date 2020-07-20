class TicketsController < ApplicationController
    before_action :require_login

    def index
        #returns an order history for user    
        @tickets = User.find(params[:user_id]).tickets
    end

    def create
        #creates a new ticket record using params passed from form
        #if ticket saves
            #redirects to tickets show page
        #else if it don't save
            #renders new ticket page
        @ticket = Ticket.create(ticket_params)
    
        if @ticket.save
            redirect_to user_ticket_path( @ticket.user_id, @ticket.id)
        else 
            render :new
        end 
    end

    def new
        #checks to see if user id params match current user
        #if a match 
            #renders new ticket form passes in instance variable
        #if not a match
            #sends to user page
        if user_check
            @ticket = Ticket.new(user_id: params[:user_id])
        else 
            send_to_user_page
        end 

    end
  
    def show        
        #check to see if ticket id and params ticket id match and checks user id
        #if not a match 
            #routes to user page
        #otherwise saves ticket record retrieved to instance variable
        redirect_if_unauthorized     
        @ticket ||= Ticket.find_by(id: params[:id])

    end 


    private 

    def get_ticket
        @ticket = Ticket.find_by(user_id: params[:user_id],id: params[:id])
    end

    def redirect_if_unauthorized
        redirect_to user_path(current_user.id) unless get_ticket
    end  

    def ticket_params    
        params.require(:ticket).permit(:time, :price, :attraction_id, :user_id,)
    end         

end
