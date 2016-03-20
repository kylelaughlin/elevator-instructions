require 'test_helper.rb'
require_relative '../lib/elevator_instructions.rb'

class ElevatorInstructionsTest < Minitest::Test

  def test_elevator_floor_with_one_move
    result = elevator_final_floor(")")
    assert_equal(1,result)
  end

  def test_elevator_floor_with_multiple_moves
    result = elevator_final_floor("))())()")
    assert_equal(3,result)
  end

  def test_one_move_of_the_elevator_up
    result = move_elevator(")",4)
    assert_equal(5,result)
  end

  def test_one_move_of_the_elevator_down
    result = move_elevator("(",0)
    assert_equal(-1,result)
  end

  def test_populate_one_floor_up
    result = populate_floors_visited([1, 2],3)
    assert_equal([1, 2, 3],result)
  end

end