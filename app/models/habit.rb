class Habit < ApplicationRecord
  belongs_to :hero
  belongs_to :area
end