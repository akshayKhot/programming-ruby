require 'test/unit'

require_relative '../lib/anagram/finder'

class TestFinder < Test::Unit::TestCase
  def test_signature
    word_signature = {
      "cat" => "act",
      "act" => "act",
      "akshay" => "aahksy"
    }

    word_signature.each do |word, signature|
      assert_equal signature, Anagram::Finder::signature_of(word)
    end
  end

  def test_lookup
    words = %w[cat akshay]
    @finder = Anagram::Finder.new(words)
    assert_equal %w(cat), @finder.lookup("cat")
    assert_equal %w(cat), @finder.lookup("act")
    assert_equal %w(cat), @finder.lookup("tca")
    assert_nil @finder.lookup("test")
  end
end