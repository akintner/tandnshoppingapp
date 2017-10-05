class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true

  has_many :line_items
  has_many :orders, through: :line_items
  
  accepts_nested_attributes_for :line_items
  
end
