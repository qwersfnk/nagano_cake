class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdrawal

  end

  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to  customers_mypage_path
  end

  private
  # ストロングパラメータ
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :email, :telephone_number)
  end

end