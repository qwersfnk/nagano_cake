class Public::AddressesController < ApplicationController
  def index
   @addresses = Address.all
   @address = Address.new
  end

  def edit
   @address = Address.find(params[:id])
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   @address.save
   redirect_to addresses_path
  end

  def update
   @address = Address.find(params[:id])
   @address.update(address_params)
   redirect_to addresses_path
  end

  def destroy
   address = Address.find(params[:id])  # データ（レコード）を1件取得
   address.destroy # データ（レコード）を削除
   redirect_to addresses_path  # 投稿一覧画面へリダイレクト
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end