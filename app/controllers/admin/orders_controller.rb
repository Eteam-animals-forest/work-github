class Admin::OrdersController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@customer), notice: "更新に成功しました."
    else
      redirect_to request.referer
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
end
