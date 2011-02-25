require 'test_helper'

class PunishmentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punishment" do
    assert_difference('Punishment.count') do
      post :create, :punishment => { }
    end

    assert_redirected_to punishment_path(assigns(:punishment))
  end

  test "should show punishment" do
    get :show, :id => punishments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => punishments(:one).to_param
    assert_response :success
  end

  test "should update punishment" do
    put :update, :id => punishments(:one).to_param, :punishment => { }
    assert_redirected_to punishment_path(assigns(:punishment))
  end

  test "should destroy punishment" do
    assert_difference('Punishment.count', -1) do
      delete :destroy, :id => punishments(:one).to_param
    end

    assert_redirected_to punishments_path
  end
end
