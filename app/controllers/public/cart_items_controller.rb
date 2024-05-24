class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.new
    @cart_items = current_customer.cart_items.includes(:item)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: 'カートアイテムを更新しました'
    else
      flash[:alert] = 'カートアイテムの更新に失敗しました'
      render :index
    end
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました'
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to cart_items_path, notice: 'カート内の商品を削除しました。'
    else
      flash[:alert] = 'カート内の商品を削除できませんでした。'
      render :index
    end
  end

  def create
    item = Item.find(cart_item_params[:item_id])
    unless item.is_active
      flash[:alert] = 'この商品は現在購入できません。'
       redirect_to item_path(item)
       return
    end
      
    @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    if @cart_item
      @cart_item.amount += cart_item_params[:amount].to_i
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.amount = cart_item_params[:amount].to_i
    end
    if @cart_item.save
      redirect_to cart_items_path, notice: "商品がカートに追加されました."
    else
      flash[:alert] = 'カートに商品を追加できませんでした。'
      redirect_to request.referer
    end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end