class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@customer), notice: "ステータス更新に成功しました."
    else
      redirect_to request.referer, alert: "ステータスを更新できませんでした"
    end
  end
end