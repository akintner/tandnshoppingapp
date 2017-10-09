require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test 'carts controller shows nothing if there is nothing in cart' do
    get cart_path

    assert_response :success
  end
end