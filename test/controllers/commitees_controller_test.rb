require 'test_helper'

class CommiteesControllerTest < ActionController::TestCase
  setup do
    @commitee = commitees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commitees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commitee" do
    assert_difference('Commitee.count') do
      post :create, commitee: {  }
    end

    assert_redirected_to commitee_path(assigns(:commitee))
  end

  test "should show commitee" do
    get :show, id: @commitee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commitee
    assert_response :success
  end

  test "should update commitee" do
    patch :update, id: @commitee, commitee: {  }
    assert_redirected_to commitee_path(assigns(:commitee))
  end

  test "should destroy commitee" do
    assert_difference('Commitee.count', -1) do
      delete :destroy, id: @commitee
    end

    assert_redirected_to commitees_path
  end
end
