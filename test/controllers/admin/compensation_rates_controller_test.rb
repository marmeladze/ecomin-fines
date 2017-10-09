require 'test_helper'

class Admin::CompensationRatesControllerTest < ActionController::TestCase
  setup do
    @compensation_rate = compensation_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compensation_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compensation_rate" do
    assert_difference('CompensationRate.count') do
      post :create, compensation_rate: {  }
    end

    assert_redirected_to compensation_rate_path(assigns(:compensation_rate))
  end

  test "should show compensation_rate" do
    get :show, id: @compensation_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compensation_rate
    assert_response :success
  end

  test "should update compensation_rate" do
    patch :update, id: @compensation_rate, compensation_rate: {  }
    assert_redirected_to compensation_rate_path(assigns(:compensation_rate))
  end

  test "should destroy compensation_rate" do
    assert_difference('CompensationRate.count', -1) do
      delete :destroy, id: @compensation_rate
    end

    assert_redirected_to compensation_rates_path
  end
end
