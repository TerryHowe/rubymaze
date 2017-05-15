class Passage < ApplicationRecord
   belongs_to :source, class_name: 'Room'
   belongs_to :destination, class_name: 'Room'
   enum direction: [:north, :east, :south, :west]
   validates :direction, uniqueness: {scope: :source, message: ' room passage must be unique'}

   def get_direction()
      return self.direction.to_s.capitalize
   end

   def self.normalize_direction(direction)
      direction = direction.to_s.downcase
      character_direction = {
         :n => 'north',
         :north => 'north',
         :e => 'east',
         :east => 'east',
         :s => 'south',
         :south => 'south',
         :w => 'west',
         :west => 'west'
      }
      return character_direction[direction.to_sym].to_s
   end

   def self.short(direction)
      shorts = {
         :north => 'N',
         :east => 'E',
         :south => 'S',
         :west => 'W'
      }
      direction = Passage.normalize_direction(direction)
      return shorts[direction.to_sym]
   end

   def self.get_left_direction(direction)
      direction = self.normalize_direction(direction)
      idx = (Passage.directions[direction] - 1) % Passage.directions.length
      return Passage.directions.key(idx)
   end

   def self.get_right_direction(direction)
      direction = self.normalize_direction(direction)
      idx = (Passage.directions[direction] + 1) % Passage.directions.length
      return Passage.directions.key(idx)
   end

   def self.get_backward_direction(direction)
      direction = self.normalize_direction(direction)
      idx = (Passage.directions[direction] + 2) % Passage.directions.length
      return Passage.directions.key(idx)
   end
end
