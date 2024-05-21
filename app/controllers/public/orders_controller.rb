class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
  end

  def create
    
  end

  def confirm
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).
  end

  def show
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end

  private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end

  end

end
