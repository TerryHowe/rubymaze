class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
   validates :x, uniqueness: {scope: :y, message: ' and Y must be unique'}
   has_many :passages, foreign_key: :source_id

   def go_forward(direction)
      direction = Passage.normalize_direction(direction)
      p = self.passages.where(direction: direction).first
      return p.nil? ? nil : p.destination
   end

   def go_left(direction)
      direction = Passage.get_left_direction(direction)
      return self.go_forward(direction)
   end

   def go_right(direction)
      direction = Passage.get_right_direction(direction)
      return self.go_forward(direction)
   end

   def go_backward(direction)
      direction = Passage.get_backward_direction(direction)
      return self.go_forward(direction)
   end

   def get_destinations(direction)
      left_direction = Passage.get_left_direction(direction)
      right_direction = Passage.get_right_direction(direction)
      forward = self.go_forward(direction)
      backward = self.go_backward(direction)
      direction = Passage.short(direction)
      left_direction = Passage.short(left_direction)
      right_direction = Passage.short(right_direction)
      unless forward.nil?
         forward = ("%d/%d/%s" % [forward.x, forward.y, direction])
      end
      unless backward.nil?
         backward = ("%d/%d/%s" % [backward.x, backward.y, direction])
      end
      return {
         'left': ("%d/%d/%s" % [self.x, self.y, left_direction]),
         'forward': forward,
         'right': ("%d/%d/%s" % [self.x, self.y,  right_direction]),
         'backward': backward
      }
   end
end
