class OrdersController < ApplicationController
  before_action :require_admin, only: [:update]
  
  def index
    @orders = current_user.sorted_orders
  end

  def show
    @order = Order.find(params[:id])

    redirect_to products_path unless @order.verified_user?(current_user)
  end

  def create
    order = current_user.orders.create
    Checkout.new(@cart.contents).submit(order)

    session.delete(:cart) 
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update(channel: params[:channel].to_i)

    flash[:success] = "Order #{order.id} updated to sales channel #{order.channel}"
    redirect_to admin_dashboard_path
  end
end
