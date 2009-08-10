require 'test_helper'

class ProduktyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produkty)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produkt" do
    assert_difference('Produkt.count') do
      post :create, :produkt => { }
    end

    assert_redirected_to produkt_path(assigns(:produkt))
  end

  test "should show produkt" do
    get :show, :id => produkty(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => produkty(:one).id
    assert_response :success
  end

  test "should update produkt" do
    put :update, :id => produkty(:one).id, :produkt => { }
    assert_redirected_to produkt_path(assigns(:produkt))
  end

  test "should destroy produkt" do
    assert_difference('Produkt.count', -1) do
      delete :destroy, :id => produkty(:one).id
    end

    assert_redirected_to produkty_path
  end
end
