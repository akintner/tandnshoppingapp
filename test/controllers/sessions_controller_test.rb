require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'login controller shows login page' do
    get orders_path

    assert_redirected_to login_path
  end
end
