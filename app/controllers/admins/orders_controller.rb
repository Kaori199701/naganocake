class Admins::OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.all.find(params[:id])
    @order_details = @order.order_details.all
  end
end
