class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details  # すべてのorder_detailを取得

    if @order_detail.update(order_detail_params)
      @order.update(status: "in_production") if @order_detail.making_status == "under_manufacture"
      if @order_details.all? { |detail| detail.making_status == "completion_of_manufacturing" }
        @order.update(status: "preparing_to_ship")
      end
    end
    redirect_to request.referer, notice: "製作ステータスを「" + @order_detail.making_status_i18n + "」に更新しました。"
  end
  
  private

  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
end