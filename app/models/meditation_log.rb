class MeditationLog < ApplicationRecord

  # Relationships
  belongs_to :daily_journey
  belongs_to :area, optional: true

  # Validations
  validates :daily_journey, :date, :presence => true
end
