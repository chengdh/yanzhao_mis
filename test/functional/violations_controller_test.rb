require 'test_helper'

class ViolationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:violations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create violation" do
    assert_difference('Violation.count') do
      post :create, :violation => { }
    end

    assert_redirected_to violation_path(assigns(:violation))
  end

  test "should show violation" do
    get :show, :id => violations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => violations(:one).to_param
    assert_response :success
  end

  test "should update violation" do
    put :update, :id => violations(:one).to_param, :violation => { }
    assert_redirected_to violation_path(assigns(:violation))
  end

  test "should destroy violation" do
    assert_difference('Violation.count', -1) do
      delete :destroy, :id => violations(:one).to_param
    end

    assert_redirected_to violations_path
  end
end
