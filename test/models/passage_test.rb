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
end
