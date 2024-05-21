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

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path, notice: "商品がカートに追加されました."
    else
      flash[:alert] = 'カートに商品を追加できませんでした.'
      redirect_to request.referer
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
