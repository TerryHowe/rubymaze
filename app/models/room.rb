class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
   validates :x, uniqueness: {scope: :y, message: ' and Y must be unique'}
   has_many :passages

   def go_forward(direction)
      return self.passages.first
      passage = self.passages.select {|p| p.direction == direction}.first
      if passage
         return passage.destination
      end
      return nil
   end
end
