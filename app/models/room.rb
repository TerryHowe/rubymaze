class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
   validates :x, uniqueness: {scope: :y, message: ' and Y must be unique'}
end
