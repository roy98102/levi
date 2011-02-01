require 'test_helper'

class LoginIntegrationTest < ActionController::IntegrationTest
  fixtures :users
  
  def test_login
    get "/"
    assert_equal 200, status
    assert_select "div#login a", "Register a New User"
    
    get "/users/sign_up"
    assert_equal 200, status
    
    post "/users", :user=>{:email=>"test@example.com", :password=>"password", :password_confirmation=>"password"}
    assert_equal 302, status
    follow_redirect!
    assert_select "div#login", /Signed in as test@example.com/
    
    get "/users/sign_out"
    assert_equal 302, status
    follow_redirect!
    assert_select "div#login a", "Register a New User"
    
    get "/users/sign_in"
    assert_equal 200, status
    post "/users/sign_in", :user=>{:email=>"test@example.com", :password=>"password"}
    assert_equal 302, status
    follow_redirect!
    assert_select "div#login", /Signed in as test@example.com/
  end
  
  def test_invalid_login
    get "/users/sign_up"
    assert_equal 200, status
    post "/users/sign_in", :user=>{:email=>"test@example.com", :password=>"blah"}
    assert_equal 200, status
    assert_select "p.alert", /Invalid email or password/
  end
end