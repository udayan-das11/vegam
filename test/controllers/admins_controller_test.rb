require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get cities" do
    get :cities
    assert_response :success
  end

  test "should get contractors" do
    get :contractors
    assert_response :success
  end

  test "should get jobs" do
    get :jobs
    assert_response :success
  end

end
