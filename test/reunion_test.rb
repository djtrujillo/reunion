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
    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Jim", 60)
    @activity_2.add_participant("John", 80)
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

  def test_reunion_can_find_total_cost
    @reunion.add_activity(@activity_1)
    assert_equal 60, @reunion.total_cost
  end

  def test_can_find_total_cost_of_2_activities
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    assert_equal 200, @reunion.total_cost
  end

  # def test_reunion_breakout
  #   @reunion.add_activity(@activity_1)
  #   @reunion.add_activity(@activity_2)
  #
  #   assert_equal 20, @reunion.breakout["Jim"]
  #   assert_equal (-10), @reunion.breakout["Joe"]
  #   assert_equal (-10), @reunion.breakout["John"]
  # end
end
