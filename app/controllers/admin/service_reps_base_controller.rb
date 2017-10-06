class Admin::ServiceRepsBaseController < ApplicationController
  before_action :require_admin

  def dashboard
    @orders     = Order.by_channel(params[:channel])
    @channels   = Order.channels.keys
    @header     = params[:channel].capitalize if params[:channel]

    render 'admin/dashboard'
  end
end