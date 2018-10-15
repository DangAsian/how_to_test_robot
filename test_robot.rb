require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @r1 = Robot.new
    @r1.needs_repairs = true
    @r1.foreign_model = true
    # act
    actual_value = @r1.station
    # assert
    assert_equal(1, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    @r2 = Robot.new
    @r2.needs_repairs = true
    @r2.vintage_model = true
    # act
    actual_value = @r2.station
    # assert
    assert_equal(2, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    @r3 = Robot.new
    @r3.needs_repairs = true
    # act
    actual_value = @r3.station
    # assert
    assert_equal(3, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    @r4 = Robot.new
    # act
    actual_value = @r4.station
    # assert
    assert_equal(4, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    @r5 = Robot.new
    # act
    actual_value = @r5.prioritize_tasks
    # assert
    assert_equal(-1, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    @r6 = Robot.new
    @r6.todos = ["work", "clean", "brush teeth"]
    # act
    actual_value = @r6.prioritize_tasks
    # assert
    assert_equal("work", actual_value)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    @r7 = Robot.new
    @r7.day_off = true
    # act
    actual_value = @r7.workday?(true)
    # assert
    assert_equal(false, actual_value)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    @r8 = Robot.new
    @r8.day_off = true
    # act
    actual_value = @r8.workday?(false)
    # assert
    assert_equal(true, actual_value)
  end

end
