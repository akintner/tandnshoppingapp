class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save
        login_user(@user)
        redirect_to products_path
      else
        flash.now[:danger] = @user.errors.full_messages.first
        render :new
      end
    end
  
    def show
      redirect_to admin_dashboard_path if current_admin?
      
      @orders = current_user.orders
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
