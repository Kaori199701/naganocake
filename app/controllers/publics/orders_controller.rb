class Publics::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      @cart_products = current_customer.cart_products
      @cart_products.each do |cart_product|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_product.product.price
        order_detail.amount = cart_product.amount
        order_detail.product_id = cart_product.product_id
        order_detail.save!
      end
      @cart_products.destroy_all
      redirect_to orders_thanks_path
    else
      render "new"
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment = params[:order][:payment]
    @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
    @order.shipping_cost = 800

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      render 'confirm'
    elsif params[:order][:address_option] == "2"
      @ship_city = current_customer.ship_cities.new
      @ship_city.city = params[:order][:city]
      @ship_city.name = params[:order][:name]
      @ship_city.postcode = params[:order][:postcode]
      @ship_city.customer_id = current_customer.id
      if @ship_city.save
      @order.postcode = @ship_city.postcode
      @order.name = @ship_city.name
      @order.city = @ship_city.city
      else
       render 'new'
      end
    end
  end

  def complete
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end


private

  def order_params
  params.require(:order).permit(:postal_code, :address, :name, :total_payment, :shipping_cost, :payment_method)
  end

  def address_params
    params.require(:order).permit(:customer_id, :postal_code, :name, :address)
  end

end
