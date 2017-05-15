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

  test "get destinations" do
    source = Room.where(x:0,y:0).first
    assert_equal({
        'forward': '0/1/N',
        'left': '0/0/W',
        'right': '0/0/E',
        'backward': nil
      },
      source.get_destinations('N'))
    assert_equal({
        'forward': '1/0/E',
        'left': '0/0/N',
        'right': '0/0/S',
        'backward': nil
      },
      source.get_destinations('E'))
    assert_equal({
        'forward': nil,
        'left': '0/0/E',
        'right': '0/0/W',
        'backward': '0/1/S'
      },
      source.get_destinations('S'))
    assert_equal({
        'forward': nil,
        'left': '0/0/S',
        'right': '0/0/N',
        'backward': '1/0/W'
      },
		source.get_destinations('W'))
  end
end
