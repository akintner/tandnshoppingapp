require 'rails_helper'

RSpec.describe LineItem, type: :model do
  before do
    @user1 = User.create(username: "Elim Garak",
                      email: "dejectedspy@cardassian.com",
                      password: "justatailor",
                      role: 0)
    @product1 = Product.create(name: "Queen Mattress", cost: 575.0)
    @order = Order.create(user_id: @user1.id)
    @line_item = LineItem.create(product_id: @product1.id, quantity: 3, order_id: @order.id, current_price_per_unit: 575.0)
  end

  context 'assocations' do
    it { should respond_to :product }
    it { should respond_to :order }
  end

  context 'methods' do
    it 'can calculate subtotal' do
      result = @line_item.subtotal

      expect(result).to eq 1725.0
    end 
  end
end