class Admin::ItemsController < ApplicationController

  def new

  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save!
    # 4. トップ画面へリダイレクト
    redirect_to admin_item_path(item.id)
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end
end