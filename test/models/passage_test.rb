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
    sut = Passage.new()
    assert_equal('west', sut.get_left_direction(:north))
    assert_equal('north', sut.get_left_direction(:east))
    assert_equal('east', sut.get_left_direction(:south))
    assert_equal('south', sut.get_left_direction(:west))
  end

  test "get right direction" do
    sut = Passage.new()
    assert_equal('east', sut.get_right_direction(:north))
    assert_equal('south', sut.get_right_direction(:east))
    assert_equal('west', sut.get_right_direction(:south))
    assert_equal('north', sut.get_right_direction(:west))
  end

  test "get backward direction" do
    sut = Passage.new()
    assert_equal('south', sut.get_backward_direction(:north))
    assert_equal('west', sut.get_backward_direction(:east))
    assert_equal('north', sut.get_backward_direction(:south))
    assert_equal('east', sut.get_backward_direction(:west))
  end
end
