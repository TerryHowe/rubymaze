require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "go foward" do
    passage = Passage.new
    destination = Room.new
    destination.id = 1
    destination.x = 0
    destination.y = 1
    source = Room.new
    source.id = 0
    source.x = 0
    source.y = 0
    passage.source = source
    passage.destination = destination
    passage.direction = :north
    source.passages = [passage]

    assert_equal(destination, source.go_forward('N'))
  end
end
