class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {unable_to_produce:0, waiting_for_production: 1, under_production: 2, production_complete: 3}
end