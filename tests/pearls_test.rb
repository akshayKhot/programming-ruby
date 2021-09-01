class PearlsTest < Minitest::Test
  def test_sort
    actual = sort [3, 2, 1, 9, 4, 5]
    assert_equal [1, 2, 3, 4, 5, 9], actual
  end

  def test_count
    actual = count [1, 1, 3, 3, 2, 5, 5, 5, 9, 8]
    assert_equal [2, 1, 2, 0, 3, 0, 0, 1, 1, 0], actual
  end

  def test_erb
    actual = erb "My name $$ is $0 $1, and I am $2 years old", %w(Akshay Khot 29)
    assert_equal "My name $ is Akshay Khot, and I am 29 years old", actual
  end

  def test_binary_search
    input_even = [0, 3, 5, 7, 9, 12, 17, 32, 45, 60] # 10
    assert_equal 4, recursive_binary_search(input_even, 9)
    assert_equal 7, recursive_binary_search(input_even, 32)
    assert_equal 9, recursive_binary_search(input_even, 60)
    assert_equal 0, recursive_binary_search(input_even, 0)
    assert_equal -1, recursive_binary_search(input_even, 10)

    input_odd = [0, 3, 5, 7, 9, 12, 17, 32, 45] # 9
    assert_equal 4, recursive_binary_search(input_odd, 9)
    assert_equal 7, recursive_binary_search(input_odd, 32)
    assert_equal -1, recursive_binary_search(input_odd, 60)
    assert_equal 0, recursive_binary_search(input_odd, 0)
    assert_equal -1, recursive_binary_search(input_odd, 10)
  end

  def test_word_finder
    sentence = "Akshay Akshay Amol Amey Bandya Amey Mangya Amol"
    assert_equal %w(Akshay Amol Amey Bandya Mangya), word_finder(sentence)
  end

  def test_word_counter
    sentence = "Akshay Akshay Amol Amey Bandya Amey Mangya Amol"
    expected_word_count = {
      "Akshay" => 2,
      "Amol" => 2,
      "Amey" => 2,
      "Bandya" => 1,
      "Mangya" => 1
    }
    assert_equal expected_word_count, word_counter(sentence)
  end
end