class Publics::CustomersController < ApplicationController
  def index
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
