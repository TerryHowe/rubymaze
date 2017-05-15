require 'test_helper'

class MazeControllerTest < ActionDispatch::IntegrationTest
R01_NORTH = """

 \\                              /
  \\                            / 
   +--------------------------+  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   +--------------------------+  
  /                            \\ 
 /                              \\

"""

R00_NORTH = """

 \\                               
  \\                              
   +                          +--
   |\\                        /|  
   | \\                      / |  
   |  +--------------------+  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  +--------------------+  |  
   | /                      \\ |  
   |/                        \\|  
   +                          +--
  /                              
 /                               

"""
R00_EAST = """

                                /
                               / 
 --+                          +  
   |\\                        /|  
   | \\                      / |  
   |  +--------------------+  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  +--------------------+  |  
   | /                      \\ |  
   |/                        \\|  
 --+                          +  
                               \\ 
                                \\

"""
R00_SOUTH = """

                                /
                               / 
 --+--------------------------+  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
 --+--------------------------+  
                               \\ 
                                \\

"""
R00_WEST = """

 \\                               
  \\                              
   +--------------------------+--
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   |                          |  
   +--------------------------+--
  /                              
 /                               

"""
R01_SOUTH = """

 \\                              /
  \\                            / 
   +                          +  
   |                         /|  
   |                        / |  
   |--+--------------------+  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |--+--------------------+  |  
   |                        \\ |  
   |                         \\|  
   +                          +  
  /                            \\ 
 /                              \\

"""
R10_WEST = """

 \\                              /
  \\                            / 
   +                          +  
   |\\                         |  
   | \\                        |  
   |  +--------------------+--|  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  |                    |  |  
   |  +--------------------+--|  
   | /                        |  
   |/                         |  
   +                          +  
  /                            \\ 
 /                              \\

"""

  test "0,1 north" do
    get maze_path(x: 0, y: 1, direction: 'N')
    assert_select "pre", R01_NORTH
  end

  test "0,0 north" do
    get maze_path(x: 0, y: 0, direction: 'N')
    assert_select "pre", R00_NORTH
  end

  test "0,0 east" do
    get maze_path(x: 0, y: 0, direction: 'E')
    assert_select "pre", R00_EAST
  end

  test "0,0 south" do
    get maze_path(x: 0, y: 0, direction: 'S')
    assert_select "pre", R00_SOUTH
  end

  test "0,0 west" do
    get maze_path(x: 0, y: 0, direction: 'W')
    assert_select "pre", R00_WEST
  end

  test "0,1 south" do
    get maze_path(x: 0, y: 1, direction: 'S')
    assert_select "pre", R01_SOUTH
  end

  test "1,0 west" do
    get maze_path(x: 1, y: 0, direction: 'W')
    assert_select "pre", R10_WEST
  end
end
