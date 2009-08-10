require 'test_helper'

class ProgramyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programy)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post :create, :program => { }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  test "should show program" do
    get :show, :id => programy(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => programy(:one).id
    assert_response :success
  end

  test "should update program" do
    put :update, :id => programy(:one).id, :program => { }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    assert_difference('Program.count', -1) do
      delete :destroy, :id => programy(:one).id
    end

    assert_redirected_to programy_path
  end
end
