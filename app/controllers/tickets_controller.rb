class TicketsController < ApplicationController
    before_action :require_login

    def index
        @tickets = Ticket.all.select{|t| t.user.id == params[:user_id].to_i}
    end

    def new
        if user_check
            @ticket = Ticket.new(user_id: params[:user_id])
        else 
            send_to_user_page
        end 

    end
  
    def show              
  
        if user_check         
            @ticket ||= Ticket.find_by(id: params[:id])
             
            if @ticket.nil?
                send_to_user_page
            end 
        else
            send_to_user_page
        end

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
  
 

    def ticket_params
    
        params.require(:ticket).permit(:time, :price, :attraction_id, :user_id,)
    end         

end
