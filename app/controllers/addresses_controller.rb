class AddressesController < ApplicationController
  before_action :require_login
  
  def show
    @address ||= Address.find_by(id: params[:id])
  end

  def new
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


  def address_params

      params.require(:address).permit(:address1, :address2, :city, :state, :zip, :user_id)
  end   

end

