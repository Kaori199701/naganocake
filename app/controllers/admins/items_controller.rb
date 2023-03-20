class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_introduction, :genre_id, :price)
  end

end
