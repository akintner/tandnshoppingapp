class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  
  accepts_nested_attributes_for :line_items

  after_validation :set_amount

  def total_price
    line_items.map { |item| item.current_price_per_unit * item.quantity.to_f }.sum
  end

  def subtotal(item)
    line_item(item).subtotal
  end

  def order_item(item)
    line_items.find_by(product_id: item.id)
  end

  def order_item_quantity(item)
    line_item(item).quantity
  end

  # def self.by_status(status)
  #   orders = Order.send(status) rescue Order.all
  #   orders.order('updated_at DESC')
  # end

  def verified_user?(current_user)
    user_id == current_user.id
  end
end
