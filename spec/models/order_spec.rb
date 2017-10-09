require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user1 = User.create(username: "Draco Malfoy",
                      email: "bestblood@rich.com",
                      password: "filthymuggles",
                      role: 0)
    @product1 = Product.create(name: "Twin Mattress", cost: 325.0)
    @order = Order.create(user_id: @user1.id)
    @line_item = LineItem.create(product_id: @product1.id, quantity: 2, order_id: @order.id, current_price_per_unit: 325.0)
  end

  context 'associations' do
    it { should belong_to :user }
    it { should have_many :products }
    it { should have_many :line_items }
  end

  it 'can will be created as default online sales channel' do
    expect(@order.channel).to eq('online')
  end

  it 'can return total price' do
    expect(@order.total_price).to eq(650.0)
  end
end