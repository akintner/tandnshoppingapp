class Admin::ServiceRepsBaseController < ApplicationController
  before_action :require_admin

  def dashboard
    @orders     = Order.by_status(params[:status])
    @statuses   = Order.statuses.keys
    @header     = params[:status].capitalize if params[:status]

    render 'admin/dashboard'
  end
end