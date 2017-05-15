class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
   validates :x, uniqueness: {scope: :y, message: ' and Y must be unique'}
   has_many :passages, foreign_key: :source_id

   def go_forward(direction)
      direction = direction.to_s
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
end
