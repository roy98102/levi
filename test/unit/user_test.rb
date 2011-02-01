require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  # Replace this with your real tests.
  test "new user" do
    u = User.new
    assert !u.save
    assert_equal 2, u.errors.to_a.length
    
    u.email = "user@example.com"
    assert !u.save
    assert_equal 2, u.errors.to_a.length
    assert u.errors.to_a.include?("Email has already been taken")
    
    u.email = "test@example.com"
    assert !u.save
    assert_equal 1, u.errors.to_a.length
    assert u.errors.to_a.include?("Password can't be blank")
    
    u.password = "password"
    assert u.save
  end
end
