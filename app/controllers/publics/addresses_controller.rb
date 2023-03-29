class Publics::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.page(params[:page])
  end

  def create
    @address = Address.new(address_params)
    @address.save
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
