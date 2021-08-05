require 'test/unit'
require_relative '../lib/anagram/options'

class TestOptions < Test::Unit::TestCase

  def test_with_no_dict
    args = %w(eat)
    opts = Anagram::Options.new(args)
    assert_equal Anagram::Options::DEFAULT_DICTIONARY, opts.dictionary
    assert_equal %w(eat), opts.words_to_find
  end

  def test_with_dict
    args = %w(-d custom_dictionary eat)
    opts = Anagram::Options.new(args)
    assert_equal "custom_dictionary", opts.dictionary
    assert_equal %w(eat), opts.words_to_find
  end

  def test_words_without_dict
    args = %w(eat ten)
    opts = Anagram::Options.new(args)
    assert_equal Anagram::Options::DEFAULT_DICTIONARY, opts.dictionary
    assert_equal %w(eat ten), opts.words_to_find
  end

  def test_words_with_dict
    args = %w(-d custom_dictionary eat ten)
    opts = Anagram::Options.new(args)
    assert_equal "custom_dictionary", opts.dictionary
    assert_equal %w(eat ten), opts.words_to_find
  end
end
