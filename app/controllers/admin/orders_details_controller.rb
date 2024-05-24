class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to request.referer, notice: "製作ステータスを「" + @order_detail.making_status_i18n + "」に更新しました。"
    else
      redirect_to request.referer, alert: "ステータスを更新できませんでした"
    end
  end
  
  private

  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
end
