require 'test_helper'

class MazeControllerTest < ActionDispatch::IntegrationTest
EXPECTED = """

 \\                               
  \\                              
   +                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   |                             
   +                             
  /                              
 /                               

"""
  test "should get maze" do
    get maze_path(x: 0, y: 0, direction: 'N')
    assert_response :success
    assert_equal "maze", @controller.action_name
    assert_select "pre", EXPECTED
  end

  #test "the maze helper" do
  #  assert_equal 'abc', @controller.render(0,0,'N')
  #end

end
