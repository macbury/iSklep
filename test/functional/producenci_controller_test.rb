require 'test_helper'

class ProducenciControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producenci)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producent" do
    assert_difference('Producent.count') do
      post :create, :producent => { }
    end

    assert_redirected_to producent_path(assigns(:producent))
  end

  test "should show producent" do
    get :show, :id => producenci(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => producenci(:one).id
    assert_response :success
  end

  test "should update producent" do
    put :update, :id => producenci(:one).id, :producent => { }
    assert_redirected_to producent_path(assigns(:producent))
  end

  test "should destroy producent" do
    assert_difference('Producent.count', -1) do
      delete :destroy, :id => producenci(:one).id
    end

    assert_redirected_to producenci_path
  end
end
