class Admins::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @item.save
    # 4. トップ画面へリダイレクト
    redirect_to 'admins/items/index'
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_introduction, :price)
  end

end
