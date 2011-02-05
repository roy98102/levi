require 'test_helper'

class CharitiesControllerTest < ActionController::TestCase
  setup do
    @charity = charities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charity" do
    assert_difference('Charity.count') do
      post :create, :charity => @charity.attributes
    end

    assert_redirected_to charity_path(assigns(:charity))
  end

  test "should show charity" do
    get :show, :id => @charity.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @charity.to_param
    assert_response :success
  end

  test "should update charity" do
    put :update, :id => @charity.to_param, :charity => @charity.attributes
    assert_redirected_to charity_path(assigns(:charity))
  end

  test "should destroy charity" do
    assert_difference('Charity.count', -1) do
      delete :destroy, :id => @charity.to_param
    end

    assert_redirected_to charities_path
  end
end
