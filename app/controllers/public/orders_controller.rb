class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def index
    @order = Order.all
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @total = 0
    if params[:order][:select_address] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:select_address] == "2"
    @address = Address.find(params[:order][:address_id])
    @order.address = @address.address
    @order.name = @address.name
    @order.postal_code = @address.postal_code
    else
    end
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   # １.&2. データを受け取り新規登録するためのインスタンス作成
   @order.save
   @cart_items = current_customer.cart_items.all
   @cart_items.each do |cart_item|
   @order_detail = OrderDetail.new(
     order_id: @order.id,
     item_id: cart_item.item_id,
     price: cart_item.item.price,
     amount: cart_item.amount
   )
   @order_detail.save
   end
   @cart_items.destroy_all
   # 3. データをデータベースに保存するためのsaveメソッド実行
   redirect_to orders_complete_path
  end

  def complete

  end

  private
    # ストロングパラメータ
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
end