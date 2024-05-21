class Admin::OrdersController < ApplicationController
  def update
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
end
