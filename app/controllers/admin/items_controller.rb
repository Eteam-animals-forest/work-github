class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: "商品が作成されました"
    else
      redirect_to new_admin_item_path, alert: "商品の作成に失敗しました"
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
      redirect_to edit_admin_item_path(@item), alert: "商品の更新に失敗しました"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :introduction, :price, :is_active, :genre_id, :name)
  end

end
