require "test_helper"

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_orders_show_url
    assert_response :success
  end

  test "should get create" do
    get public_orders_create_url
    assert_response :success
  end

  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

  test "should get log" do
    get public_orders_log_url
    assert_response :success
  end

  test "should get thanx" do
    get public_orders_thanx_url
    assert_response :success
  end

  test "should get index" do
    get public_orders_index_url
    assert_response :success
  end
end
