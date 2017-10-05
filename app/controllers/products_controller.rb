class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:cost)
  end

  def show
    @product = Product.find(params[:id])
  end
end
