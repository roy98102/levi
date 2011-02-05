require 'test_helper'

class CharitiesControllerTest < ActionController::TestCase
  fixtures :charities

  setup do
    @charity = charities(:sample)
    @new_charity = {:name => "unique", :site=> "foo"}
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

  test "should create unique new charity" do
    assert_difference('Charity.count') do
      post :create, :charity => @new_charity
    end

    assert_redirected_to charity_path(assigns(:charity))
  end

  test "should not re-create charity" do
    assert_no_difference('Charity.count') do
      post :create, :charity => @charity.attributes
    end

    assert_template 'new'
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
