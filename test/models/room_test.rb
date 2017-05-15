require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "go foward" do
    source = Room.where(x:0,y:0).first
    destination = Room.where(x:0,y:1).first
    assert_equal(destination, source.go_forward(:north))
  end

  test "go left direction" do
    source = Room.where(x:0,y:0).first
    assert_equal('west', source.go_left_direction(:north))
    assert_equal('north', source.go_left_direction(:east))
    assert_equal('east', source.go_left_direction(:south))
    assert_equal('south', source.go_left_direction(:west))
  end
end
