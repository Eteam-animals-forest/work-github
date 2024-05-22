class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to request.referer, notice: "ステータス更新に成功しました."
    else
      redirect_to request.referer, alert: "ステータスを更新できませんでした"
    end
  end
end
