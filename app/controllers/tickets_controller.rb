class TicketsController < ApplicationController
    before_action :require_login

    def index
    
        @tickets = User.find(params[:user_id]).tickets
    end

    def new
        if user_check
            @ticket = Ticket.new(user_id: params[:user_id])
        else 
            send_to_user_page
        end 

    end
  
    def show        
        redirect_if_unauthorized     
        @ticket ||= Ticket.find_by(id: params[:id])

    end 

    def create
        @ticket = Ticket.create(ticket_params)
    
        if @ticket.save
            redirect_to user_ticket_path( @ticket.user_id, @ticket.id)
        else 
            render :new
        end 
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
