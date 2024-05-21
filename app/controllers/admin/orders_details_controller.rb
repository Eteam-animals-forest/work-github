class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to request.referer, notice: "更新に成功しました."
    else
      redirect_to request.referer
    end
  end
end
