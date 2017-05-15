class Passage < ApplicationRecord
   belongs_to :source, class_name: 'Room'
   belongs_to :destination, class_name: 'Room'
   enum direction: [:north, :east, :south, :west]
   validates :direction, uniqueness: {scope: :source, message: ' room passage must be unique'}

   def get_direction()
      return self.direction.to_s.capitalize
   end

   def go_left_direction(direction)
      direction = direction.to_s
      idx = (Passage.directions[direction] - 1) % Passage.directions.length
      return Passage.directions.key(idx)
   end

   def go_right_direction(direction)
      direction = direction.to_s
      idx = (Passage.directions[direction] + 1) % Passage.directions.length
      return Passage.directions.key(idx)
   end
end
