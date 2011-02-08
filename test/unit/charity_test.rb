require 'test_helper'

class CharityTest < ActiveSupport::TestCase
  fixtures :charities

  test "new charity" do
    c = Charity.new
    assert !c.save
    assert_not_equal 0, c.errors.to_a.length
    assert c.errors.to_a.include?("Name can't be blank")

    c.description = 'foo'
    assert !c.save

    c.name = 'foo'
    assert !c.save, 'We have "foo" in a fixture.'
    assert c.errors.to_a.include?("Name has already been taken")

    c.name = '0123456789' * 20
    assert !c.save
    assert c.errors.to_a[0] =~ /Name is too long/;

    c.name = 'googlecharity'
    c.site = 'http://google.comedy'
    assert !c.save
    assert c.errors.to_a[0] =~ /could not be reached/;

    c.site = 'http://google.com' # Note: requires redirection
    assert c.valid?, c.errors.to_s
    assert c.save
  end

  test "edit charity" do
    c = Charity.find_by_name("Sample Charity")
    assert c

    c.name = 'foo'
    assert !c.save, 'We have "foo" in a fixture.'
    assert c.errors.to_a.include?("Name has already been taken")

    c.name = 'random name'
    assert c.save, c.errors.to_s
  end
end
