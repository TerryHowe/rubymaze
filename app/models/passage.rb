class Passage < ApplicationRecord
   belongs_to :source, class_name: 'Room'
   belongs_to :destination, class_name: 'Room'
   enum direction: [:north, :east, :south, :west]
   validates :direction, uniqueness: {scope: :source, message: ' room passage must be unique'}

   def get_direction()
      return self.direction.to_s.capitalize
   end
end
