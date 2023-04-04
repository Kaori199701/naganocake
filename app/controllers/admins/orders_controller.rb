class Admins::OrdersController < ApplicationController

  def show
    @order = Order.all.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
       redirect_to admins_order_path(@order.id)
    else
       redirect_to admins_order_path(@order.id)
    end
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

end

