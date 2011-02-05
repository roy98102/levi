require 'test_helper'

class CharityTest < ActiveSupport::TestCase
  fixtures :charities

  test "new charity" do
    c = Charity.new
    assert !c.save
    assert_not_equal 0, c.errors.to_a.length
    assert c.errors.to_a.include?("Name can't be blank")

    c.logo = "foo"
    assert !c.save

    c.site = "foo"
    assert !c.save

    c.description = "foo"
    assert !c.save

    c.name = "foo"
    assert !c.save, 'We have "foo" in a fixture.'
    assert c.errors.to_a.include?("Name has already been taken")

    c.name = "random name"
    assert c.valid?
    assert c.save
  end

  test "edit charity" do
    c = Charity.find_by_name("Sample Charity")
    assert c

    c.name = "foo"
    assert !c.save, 'We have "foo" in a fixture.'
    assert c.errors.to_a.include?("Name has already been taken")

    c.name = "random name"
    assert c.save
  end
end
