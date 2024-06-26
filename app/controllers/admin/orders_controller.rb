class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: "awaiting_manufacture") if @order.status == "payment_confirmation"
    end
    redirect_to admin_order_path(@order), notice: "注文ステータスを「" + @order.status_i18n + "」に更新しました。"
  end

  private

  def order_params

    params.require(:order).permit(:status)

  end
end