class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  end

  def update
  end

  def destroy
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
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
