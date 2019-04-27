class HabitChain < ApplicationRecord

  # Relationships
  belongs_to :habit
  has_many :habit_logs

  # Validations
  validates :habit, :start_date, :presence => true
end
