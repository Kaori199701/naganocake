class Admins::ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save
    # 4. トップ画面へリダイレクト
    redirect_to '/items/index'
  end

  def show
  end

  def edit
  end

  def update
  end

end
