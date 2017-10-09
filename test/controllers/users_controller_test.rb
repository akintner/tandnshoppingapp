require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'new users controller shows login page' do
    get new_user_path

    assert_response :success
  end
end