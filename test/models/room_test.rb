require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "go foward" do
    source = Room.where(x:0,y:0).first
    destination = Room.where(x:0,y:1).first
    assert_equal(destination, source.go_forward(:north))
  end

  test "go left" do
    source = Room.where(x:0,y:0).first
    destination = Room.where(x:0,y:1).first
    assert_equal(destination, source.go_left(:east))
  end

  test "go right" do
    source = Room.where(x:0,y:0).first
    destination = Room.where(x:0,y:1).first
    assert_equal(destination, source.go_right(:west))
  end

  test "go backward" do
    source = Room.where(x:0,y:0).first
    destination = Room.where(x:0,y:1).first
    assert_equal(destination, source.go_backward(:south))
  end
end
