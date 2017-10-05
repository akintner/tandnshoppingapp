class Product < ApplicationRecord
  has_many :line_items
  accepts_nested_attributes_for :line_items
  
end
