require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_activity_initiates_with_name
    assert_instance_of Activity, @activity
    assert_equal "Brunch", @activity.name
  end

  def test_activity_initiates_with_no_participants
    assert_instance_of Hash, @activity.participants
  end

  def test_activity_can_add_participant
    @activity.add_participant("Jim", 20)

    assert_equal 20, @activity.participants["Jim"]
  end

  def test_activity_adds_total_cost
    @activity.add_participant("Jim", 20)
    @activity.add_participant("Joe", 40)

    assert_equal 60, @activity.total_cost
  end

  def test_activity_splits_the_cost_between_participants
    @activity.add_participant("Jim", 20)
    @activity.add_participant("Joe", 40)

    assert_equal 30, @activity.split
  end

  def test_activity_calculates_how_much_each_participant_owes
    @activity.add_participant("Jim", 20)
    @activity.add_participant("Joe", 40)

    assert_equal 10, @activity.owed["Jim"]
    assert_equal (-10), @activity.owed["Joe"]
  end

end
