class Habit < ApplicationRecord

  # Relationships
  belongs_to :hero
  belongs_to :area
  has_many :habit_chains, dependent: :destroy
  has_many :habit_logs

  # Validations
  validates :hero, :area, :name, :active, :acheived, :presence => true
end
