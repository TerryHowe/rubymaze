class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
   validates :x, uniqueness: {scope: :y, message: ' and Y must be unique'}
   has_many :passages, foreign_key: :source_id

   def go_forward(direction)
      direction = direction.to_s
      for p in self.passages
         if p.direction == direction
            return p.destination
         end
      end
      return nil
   end
end
