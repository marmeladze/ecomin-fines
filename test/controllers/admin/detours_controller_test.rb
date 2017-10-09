require 'test_helper'

class Admin::DetoursControllerTest < ActionController::TestCase
  setup do
    @detour = detours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detour" do
    assert_difference('Detour.count') do
      post :create, detour: {  }
    end

    assert_redirected_to detour_path(assigns(:detour))
  end

  test "should show detour" do
    get :show, id: @detour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detour
    assert_response :success
  end

  test "should update detour" do
    patch :update, id: @detour, detour: {  }
    assert_redirected_to detour_path(assigns(:detour))
  end

  test "should destroy detour" do
    assert_difference('Detour.count', -1) do
      delete :destroy, id: @detour
    end

    assert_redirected_to detours_path
  end
end
