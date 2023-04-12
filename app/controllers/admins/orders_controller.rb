class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all

  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if  @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "製作待ち"
    end
    redirect_to admins_order_path(@order.id)
  end


private

  def order_params
    params.require(:order).permit(:status)
  end


end

