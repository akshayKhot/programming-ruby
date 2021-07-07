require "./feature/document"

class DocumentTest < Test::Unit::TestCase
  def test_title
    assert_equal "Programming Ruby", Document.new.title
  end
end