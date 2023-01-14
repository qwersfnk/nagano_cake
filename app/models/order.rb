class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum status: {awaiting_payment:0, confirmation_of_payment: 1, in_production: 2, preparing_to_ship: 3, shipped: 4}
  enum payment_method: { credit_card: 0, transfer: 1 }

end
