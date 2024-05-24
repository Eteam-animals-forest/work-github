class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "注文ステータスを「" + @order.status_i18n + "」に更新しました。"
    else
      redirect_to admin_order_path(@order), alert: "ステータスを更新できませんでした"
    end
  end

  private

  def order_params

    params.require(:order).permit(:status)

  end
end