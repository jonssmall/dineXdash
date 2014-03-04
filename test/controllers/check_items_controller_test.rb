require 'test_helper'

class CheckItemsControllerTest < ActionController::TestCase
  setup do
    @check_item = check_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_item" do
    assert_difference('CheckItem.count') do
      post :create, check_item: { item_desc: @check_item.item_desc, item_name: @check_item.item_name, price: @check_item.price, restaurant_id: @check_item.restaurant_id }
    end

    assert_redirected_to check_item_path(assigns(:check_item))
  end

  test "should show check_item" do
    get :show, id: @check_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_item
    assert_response :success
  end

  test "should update check_item" do
    patch :update, id: @check_item, check_item: { item_desc: @check_item.item_desc, item_name: @check_item.item_name, price: @check_item.price, restaurant_id: @check_item.restaurant_id }
    assert_redirected_to check_item_path(assigns(:check_item))
  end

  test "should destroy check_item" do
    assert_difference('CheckItem.count', -1) do
      delete :destroy, id: @check_item
    end

    assert_redirected_to check_items_path
  end
end
