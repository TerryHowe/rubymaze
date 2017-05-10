class Room < ApplicationRecord
   validates :x, numericality: {only_integer: true}
   validates :y, numericality: {only_integer: true}
end
