class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: "商品が作成されました"
    else
      flash.now[:alert] = "商品の作成に失敗しました"
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: "商品が更新されました"
    else
      flash.now[:alert] = "商品の更新に失敗しました"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :introduction, :price, :is_active, :genre_id, :name)
  end

end
