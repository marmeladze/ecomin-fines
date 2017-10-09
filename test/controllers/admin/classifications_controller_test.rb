require 'test_helper'

class Admin::ClassificationsControllerTest < ActionController::TestCase
  setup do
    @classification = classifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classification" do
    assert_difference('Classification.count') do
      post :create, classification: {  }
    end

    assert_redirected_to classification_path(assigns(:classification))
  end

  test "should show classification" do
    get :show, id: @classification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classification
    assert_response :success
  end

  test "should update classification" do
    patch :update, id: @classification, classification: {  }
    assert_redirected_to classification_path(assigns(:classification))
  end

  test "should destroy classification" do
    assert_difference('Classification.count', -1) do
      delete :destroy, id: @classification
    end

    assert_redirected_to classifications_path
  end
end
