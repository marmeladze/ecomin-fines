require 'test_helper'

class Admin::HeightRangesControllerTest < ActionController::TestCase
  setup do
    @height_range = height_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:height_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create height_range" do
    assert_difference('HeightRange.count') do
      post :create, height_range: {  }
    end

    assert_redirected_to height_range_path(assigns(:height_range))
  end

  test "should show height_range" do
    get :show, id: @height_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @height_range
    assert_response :success
  end

  test "should update height_range" do
    patch :update, id: @height_range, height_range: {  }
    assert_redirected_to height_range_path(assigns(:height_range))
  end

  test "should destroy height_range" do
    assert_difference('HeightRange.count', -1) do
      delete :destroy, id: @height_range
    end

    assert_redirected_to height_ranges_path
  end
end
