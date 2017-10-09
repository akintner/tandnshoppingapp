class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  
  accepts_nested_attributes_for :line_items

  enum channel: %w(online cx retail)  

  def total_price
    line_items.map { |item| item.current_price_per_unit * item.quantity.to_f }.sum
  end

  def self.by_channel(channel)
    orders = Order.send(channel) rescue Order.all
    orders.order('updated_at DESC')
  end

  def verified_user?(current_user)
    user_id == current_user.id || current_user.admin?
  end
end
