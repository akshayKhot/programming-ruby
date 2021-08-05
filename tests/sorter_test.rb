require "minitest/autorun"
require "./zoo/sorter"

class TestSorter < Minitest::Test
  def setup
    @sorter = Sorter.new
  end
  
  def test_salary
    expected = "Design floor plans
Review and edit plans
Prepare the ground
Pour the foundation
Frame the structure
Driveway, Electrical, HVAC, Landscaping, Plumbing, Roofing, Siding,Windows
Drywall, Shingles
Paint
Carpet"

    assert_equal expected, @sorter.sort
  end
end