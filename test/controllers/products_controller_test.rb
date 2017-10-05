require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'products index works' do
    product = Fabricate.build(:twin_mattress_product).tap(&:valid?)

    get products_path

    assert_response :success
  end
end
