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

  test "go left direction" do
    sut = Passage.new()
    assert_equal('west', sut.go_left_direction(:north))
    assert_equal('north', sut.go_left_direction(:east))
    assert_equal('east', sut.go_left_direction(:south))
    assert_equal('south', sut.go_left_direction(:west))
  end
end
