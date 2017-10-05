class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def subtotal
    current_price_per_unit * quantity
  end
end
