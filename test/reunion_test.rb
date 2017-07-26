require 'minitest'
require 'minitest/test'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("Denver")
    @activity_1 = Activity.new("Brunch")
    @activity_1.add_participant("Jim", 20)
    @activity_1.add_participant("Joe", 40)
  end

  def test_reunion_intiates_with_location_name_and_no_activities
    assert_equal "Denver", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_reunion_can_add_activity
    @reunion.add_activity(@activity_1)
    assert_instance_of Activity, @reunion.activities[0]
    assert_equal 1, @reunion.activities.count
  end
end
