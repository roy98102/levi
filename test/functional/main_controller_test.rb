require 'test_helper'

class MainControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  #test "the truth" do
  #  assert true
  #end
  test "user" do
    @user = Factory.build(:user)
    sign_in @user
  end
end
