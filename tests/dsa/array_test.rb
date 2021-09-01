class ArrayTest < Minitest::Test
  def test_two_sum
    two_sum = TwoSum.new

    numbers_one = [8, 7, 2, 5, 3, 1]
    assert_equal [2, 8], two_sum.find_sum(numbers_one, 10)
    assert_equal [1, 3], two_sum.find_sum(numbers_one, 4)
    assert_equal [2, 5], two_sum.find_sum(numbers_one, 7)
    assert_equal "not found", two_sum.find_sum(numbers_one, 35)

    numbers_two = [5, 2, 6, 8, 1, 9]
    assert_equal [8, 9], two_sum.find_sum(numbers_two, 17)
    assert_equal "not found", two_sum.find_sum(numbers_two, 12)
  end

  def test_binary_sort
    assert_equal [0, 1], BinarySort.sort([1, 0])
    assert_equal [0, 0, 0, 0, 1, 1, 1, 1], BinarySort.sort([1, 0, 1, 0, 1, 0, 0, 1])
  end
end