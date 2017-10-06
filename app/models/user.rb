class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  has_many :orders

  enum role: %w(default admin)  

  def verified?(params_id)
    id == params_id.to_i
  end

  def sorted_orders
    orders.order('updated_at DESC')
  end
end