class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  skip_before_action :require_login
  
  def create
    item = Product.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:success] = "You now have 
    #{pluralize(@cart.count_of(item.id), "order")} of 
    #{item.name} in your cart."
    
    redirect_back(fallback_location: products_path)
  end

  def index
    @items = @cart.items
  end

  def update
    @cart.update_item(params)
    session[:cart] = @cart.contents

    redirect_to cart_path
  end

  def destroy
    item = Product.find(params[:item_id])
    @cart.remove(item.id)

    flash[:success] = "Successfully removed
    #{item.name} from your cart."

    redirect_to cart_path
  end
end
