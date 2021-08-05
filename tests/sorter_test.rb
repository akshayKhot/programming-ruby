require "minitest/autorun"
require "./zoo/dependency_tracker"

class TestSorter < Minitest::Test
  def setup
    @tracker = DependencyTracker.new
  end
  
  def test_salary
    expected = "Design floor plans
Review and edit plans
Prepare the ground
Pour the foundation
Frame the structure
Driveway, Electrical, HVAC, Landscaping, Plumbing, Roofing, Siding, Windows
Shingles
Drywall
Paint
Carpet"

    assert_equal expected, @tracker.track
  end
end