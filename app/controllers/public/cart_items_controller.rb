class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.includes(:item)
  end

  def update
    @cart_item = CartItem.find(params[:id])
  if @cart_item.update(cart_item_params)
     redirect_to  public_cart_items_path, notice: 'カートアイテムを更新しました'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    
  end

  def create
  end

  def destroy_all
  end
end
