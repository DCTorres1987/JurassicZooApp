class AddressesController < ApplicationController
  before_action :require_login
  
  def show
    #checks to see if user is logged in and checking against params user id
    #if matches sets instance variable to current user 
    #retrieves address by id and sets to instance variable
    # if don't match it redirects to user page  
    redirect_if_unauthorized
    
    @address ||= Address.find_by(user_id: params[:user_id], id: params[:id])     

  end

  def new

    #checks to see if user is logged in and checking against params user id
    #if matches retrieves passes in params user id into and render new page
  
    @address = Address.new(user_id: params[:user_id]) 

  end 

  def create

    #if review dosent' exist create review record useing review paramss
    #if review exist it will render review show page
    #if review saves successfully it will render show page

    @address = current_user.addresses.build(address_params)

    if @address.save 
      redirect_to user_address_path(@address.user.id, @address.id)

    else        
        render :new
    end 
  end 

  private 

  def get_address
    Address.find_by(user_id: params[:user_id], id: params[:id])
  end

  def redirect_if_unauthorized
    redirect_to user_path(current_user.id) unless get_address
  end 


  def address_params
      params.require(:address).permit(:address1, :address2, :city, :state, :zip, :user_id)
  end   

end

