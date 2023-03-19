class Admins::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def show
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
