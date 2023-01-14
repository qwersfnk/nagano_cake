class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
   @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save
  end

   private
  def item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end