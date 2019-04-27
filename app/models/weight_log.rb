class WeightLog < ApplicationRecord

  # Relationships
  belongs_to :area
  belongs_to :daily_journey

  # Validations
  validates :daily_journey, :area, :date, :presence => true
end
