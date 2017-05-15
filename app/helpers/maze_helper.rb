module MazeHelper

VIEW = """
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
"""
LEFT = """
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
RIGHT = """
                                /
                               / 
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
                               \\ 
                                \\
"""
FORWARD = """
                                 
                                 
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
                                 
                                 
"""
LEFT_FORWARD_RIGHT = """
                                 
                                 
 --+                             
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
 --+                             
                                 
                                 
"""
RIGHT_FORWARD_LEFT = """
                                 
                                 
                              +--
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
                              +--
                                 
                                 
"""
FORWARD_FORWARD = """
                                 
                                 
                                 
                                 
                                 
      +--------------------+     
      |                    |     
      |                    |     
      |                    |     
      |                    |     
      |                    |     
      |                    |     
      |                    |     
      +--------------------+     
                                 
                                 
                                 
                                 
                                 
"""
FORWARD_LEFT = """
                                 
                                 
   +                             
   |\\                            
   | \\                           
   |  +                          
   |  |                          
   |  |                          
   |  |                          
   |  |                          
   |  |                          
   |  |                          
   |  |                          
   |  +                          
   | /                           
   |/                            
   +                             
                                 
                                 
"""
FORWARD_RIGHT = """
                                 
                                 
                              +  
                             /|  
                            / |  
                           +  |  
                           |  |  
                           |  |  
                           |  |  
                           |  |  
                           |  |  
                           |  |  
                           |  |  
                           +  |  
                            \\ |  
                             \\|  
                              +  
                                 
                                 
"""
FORWARD_LEFT_FORWARD_RIGHT = """
                                 
                                 
                                 
                                 
                                 
    --+                          
      |                          
      |                          
      |                          
      |                          
      |                          
      |                          
      |                          
    --+                          
                                 
                                 
                                 
                                 
                                 
"""
FORWARD_RIGHT_FORWARD_LEFT = """
                                 
                                 
                                 
                                 
                                 
                           +--   
                           |     
                           |     
                           |     
                           |     
                           |     
                           |     
                           |     
                           +--   
                                 
                                 
                                 
                                 
                                 
"""

  def render(room, direction)
    t = [VIEW]
    left_room = room.go_left(direction)
    forward_room = room.go_forward(direction)
    #right_room = room.go_right(direction)
    if left_room.nil?
      t.append(LEFT)
    else
      if left_room.go_forward(direction).nil?
        t.append(LEFT_FORWARD_RIGHT)
      end
    end
    if forward_room.nil?
      t.append(FORWARD)
      puts 'wot'
    else
      forward_left_room = forward_room.go_left(direction)
      if forward_left_room.nil?
        t.append(FORWARD_LEFT)
      else
        if forward_left_room.go_forward(direction).nil?
          t.append(FORWARD_LEFT_FORWARD_RIGHT)
        end
      end
      if forward_room.go_forward(direction).nil?
        t.append(FORWARD_FORWARD)
      end
    #  forward_right_room = forward_room.go_right(direction)
    #  if forward_right_room:
    #    if not forward_right_room.go_forward(direction):
    #      t.append(FORWARD_RIGHT_FORWARD_LEFT)
    #  else
    #    t.append(FORWARD_RIGHT)
    end
    #if right_room.nil?
    #  t.append(RIGHT)
    #else
    #  if not right_room.go_forward(direction):
    #    t.append(RIGHT_FORWARD_LEFT)
    #end
    r3 = (t.map{|x| x.split("")}).transpose
    return (r3.map{|x| x.max}).join("")
  end
end
