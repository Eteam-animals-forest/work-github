class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    if @order.payment_method == "credit_card"
        @order.payment_method = Order.payment_methods.key(0)
    else
        @order.payment_method = Order.payment_methods.key(1)
    end
    if params[:order][:address_type] == "customer_address"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_type] == "registered_address"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
    elsif params[:order][:address_type] == "new_address"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
        render 'new'
    end
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item_id
      @order_details.amount = cart_item.amount
      @order_details.price = (cart_item.item.price*1.1).floor
      @order_details.order_id = @order.id
      @order_details.save
    end
    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end

  private

    def order_params
      params.require(:order).permit(:shipping_cost, :payment_method, :postal_code, :address, :name, :customer_id, :total_payment, :status)
    end

end
