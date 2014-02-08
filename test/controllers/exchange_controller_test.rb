require 'test_helper'

class ExchangeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get get_data" do
    get :exchange_date
    assert_response :success
  end

  test "should get find" do
    get :find
    assert_response :success
  end

end
