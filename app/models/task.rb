class Task < ApplicationRecord

  # Relationships
  belongs_to :daily_journey
  belongs_to :hero

  # Validations
  validates :hero, :name, :done, :presence => true
end
