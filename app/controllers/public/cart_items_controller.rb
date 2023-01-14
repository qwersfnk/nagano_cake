class Public::CartItemsController < ApplicationController

  def index
   @cart_items = current_customer.cart_items
  end

  def create
  if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id] ).present?
   @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id] )
   @cart_item.update(amount: cart_item_params[:amount].to_i+@cart_item.amount)
  else
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   # １.&2. データを受け取り新規登録するためのインスタンス作成
   @cart_item.save
   # 3. データをデータベースに保存するためのsaveメソッド実行
  end
 redirect_to cart_items_path
 # 4. トップ画面へリダイレクト
  end

  def update
   @cart_items = CartItem.find(params[:id])
   @cart_items.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
   cart_items = CartItem.find(params[:id])  # データ（レコード）を1件取得
   cart_items.destroy  # データ（レコード）を削除
   redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト
  end

  def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path
  end

  private
  # ストロングパラメータ
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end