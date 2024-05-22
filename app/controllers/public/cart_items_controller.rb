class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_item = CartItem.new
    @cart_items = current_customer.cart_items.includes(:item)
  end

  def update
      @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to  cart_items_path, notice: 'カートアイテムを更新しました'
    else
      flash[:alert] = 'カートアイテムの更新に失敗しました'
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path, notice: 'カート内の商品を削除しました。'
    else
      flash[:alert] = 'カート内の商品を削除できませんでした。'
      render :index
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path, notice: "商品がカートに追加されました."
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました'
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
