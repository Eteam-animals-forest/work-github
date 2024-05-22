class Public::ItemsController < ApplicationController
  before_action :set_genres, only: [:index, :show, :search, :genre_search]

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def search
    @content = params[:content]
    @items = Item.where("name LIKE ?", "%#{@content}%").page(params[:page]).per(8)
    render :index
  end

  def genre_search
    redirect_to items_path(genre_id: params[:genre_id], page: params[:page])
  end

  private

  def set_genres
    @genres = Genre.all
  end
end
