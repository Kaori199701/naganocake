class Publics::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to publics_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       flash[:notice] = "You have created address successfully."
       redirect_to publics_addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to publics_addresses_path
  end


private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
