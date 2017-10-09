require 'test_helper'

class Admin::MaterialVolumesControllerTest < ActionController::TestCase
  setup do
    @material_volume = material_volumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_volumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_volume" do
    assert_difference('MaterialVolume.count') do
      post :create, material_volume: {  }
    end

    assert_redirected_to material_volume_path(assigns(:material_volume))
  end

  test "should show material_volume" do
    get :show, id: @material_volume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_volume
    assert_response :success
  end

  test "should update material_volume" do
    patch :update, id: @material_volume, material_volume: {  }
    assert_redirected_to material_volume_path(assigns(:material_volume))
  end

  test "should destroy material_volume" do
    assert_difference('MaterialVolume.count', -1) do
      delete :destroy, id: @material_volume
    end

    assert_redirected_to material_volumes_path
  end
end
