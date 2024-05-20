class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.includes(:item)
  end

  def update
      @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
       redirect_to  cart_items_path, notice: 'カートアイテムを更新しました'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: 'カート内の商品を削除しました。'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました'
  end
  
  def create
  end

  
end
