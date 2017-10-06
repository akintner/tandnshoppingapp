class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    redirect_to dashboard_path if current_user
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      login_user(@user)
      redirect_to products_path
    else
      flash.now[:danger] = 'Name or password incorrect'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
