class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_detail][:order_id])
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  # ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status, :created_at)
  end

end
