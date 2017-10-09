require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test 'orders controller shows login page when no one is logged in' do
    get orders_path

    assert_redirected_to login_path
  end
end