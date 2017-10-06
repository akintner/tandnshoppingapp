require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test '#set_amount_from_one_item' do
    order = Fabricate.build(:order, line_items: [
      Fabricate.build(:line_item,
        product: Fabricate.build(:twin_mattress_product)
      )
    ]).tap(&:valid?)
    assert_equal order.amount, 325.0
  end
end
