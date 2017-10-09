require 'test_helper'

class Admin::ForestriesControllerTest < ActionController::TestCase
  setup do
    @forestry = forestries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forestries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forestry" do
    assert_difference('Forestry.count') do
      post :create, forestry: {  }
    end

    assert_redirected_to forestry_path(assigns(:forestry))
  end

  test "should show forestry" do
    get :show, id: @forestry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forestry
    assert_response :success
  end

  test "should update forestry" do
    patch :update, id: @forestry, forestry: {  }
    assert_redirected_to forestry_path(assigns(:forestry))
  end

  test "should destroy forestry" do
    assert_difference('Forestry.count', -1) do
      delete :destroy, id: @forestry
    end

    assert_redirected_to forestries_path
  end
end
