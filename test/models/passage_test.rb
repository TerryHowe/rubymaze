require 'test_helper'

class PassageTest < ActiveSupport::TestCase
  test "get direction" do
    passage = Passage.new
    passage.direction = :north
    assert_equal("North", passage.get_direction())
    passage.direction = :east
    assert_equal("East", passage.get_direction())
    passage.direction = :south
    assert_equal("South", passage.get_direction())
    passage.direction = :west
    assert_equal("West", passage.get_direction())
  end

  test "get left direction" do
    assert_equal('west', Passage.get_left_direction(:north))
    assert_equal('north', Passage.get_left_direction(:east))
    assert_equal('east', Passage.get_left_direction(:south))
    assert_equal('south', Passage.get_left_direction(:west))
  end

  test "get right direction" do
    assert_equal('east', Passage.get_right_direction(:north))
    assert_equal('south', Passage.get_right_direction(:east))
    assert_equal('west', Passage.get_right_direction(:south))
    assert_equal('north', Passage.get_right_direction(:west))
  end

  test "get backward direction" do
    assert_equal('south', Passage.get_backward_direction(:north))
    assert_equal('west', Passage.get_backward_direction(:east))
    assert_equal('north', Passage.get_backward_direction(:south))
    assert_equal('east', Passage.get_backward_direction(:west))
  end
end
