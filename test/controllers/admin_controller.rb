require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'admin controller will load login page' do
    get admin_dashboard_path

    assert_response :success
    assert_redirected_to login_path    
  end
end