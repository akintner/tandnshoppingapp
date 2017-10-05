require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test '#make_products' do
    product = Fabricate.build(:twin_mattress_product).tap(&:valid?)

    assert_equal product.cost, 325.0
    assert_equal product.name, 'Twin Mattress'
  end
end