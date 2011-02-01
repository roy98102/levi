require 'test_helper'

class MainControllerTest < ActionController::TestCase
  fixtures :users
  # Replace this with your real tests.
  #test "the truth" do
  #  assert true
  #end
  test "sign in" do
    user = users(:one)
    sign_in user
    assert_equal @controller.current_user.email, users(:one).email
  end
end
