require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'login controller shows login page' do
    get login_path

    assert_response :success
    assert_redirected_to login_path
  end
end
