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
    if @cart_item.save
      redirect_to cart_items_path
    else
      render 'public/item/show'
    end
  end

  def destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id)
  end
end
