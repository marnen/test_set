require 'test/unit'
require File.dirname(__FILE__) + '/../test_set'

class TestSetTest < Test::Unit::TestCase

  def setup

  end

  def test_should_calculate_average
    assert_equal 6, TestSet.new(8, 10, 2, 6, 4).average
    assert_equal 5.5, TestSet.new(10, 11, 0, 1).average
  end

  # The median is the middle value in a set of values.  If there are
  # an even number of values, it should be the average of the two middle
  # values
  def test_should_calculate_median
    assert_equal 6, TestSet.new(8, 10, 2, 6, 4).median
    assert_equal 4.5, TestSet.new(10, 0, 1, 9, 8, 1).median
  end
  
  # Average and median should work properly with floating-point numbers in set.
  def test_should_understand_floating_point
    assert_equal 1.75, TestSet.new(2.5, 1).average
    assert_equal 0.2, TestSet.new(0.2, 0.1, 8).median
  end
  
  # Average and median should work with string representations of numbers.
  def test_average_and_median_should_understand_strings
    assert_equal 6, TestSet.new(8, 10, '2', 6, 4).average
    assert_equal 4.5, TestSet.new('10', 0, 1, '9', 8, 1).median
    assert_equal 0.2, TestSet.new(0.2, '0.1', 8).median
  end

  def test_should_split_into_evenly_sized_subsets
    values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

    subsets = TestSet.new(*values).partition(3)
    assert_equal 3, subsets.length
    subsets.each do |subset|
      assert_equal 5, subset.length
    end
    assert_equal values.length, subsets.flatten.length    

    values << 16
    subsets = TestSet.new(*values).partition(3)
    assert_equal 3, subsets.length
    subsets.each do |subset|
      assert_in_delta 5, subset.length, 1
    end
    assert_equal values.length, subsets.flatten.length    
  end
end
