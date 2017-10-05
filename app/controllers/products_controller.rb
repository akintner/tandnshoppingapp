class ProductsController < ApplicationController
  skip_before_action :require_login

  def index
    @products = Product.all.order(:cost)
  end

  def show
    @product = Product.find(params[:id])
  end
end
