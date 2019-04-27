class MeditationLog < ApplicationRecord

  # Relationships
  belongs_to :daily_journey
  belongs_to :area

  # Validations
  validates :daily_journey, :date, :done, :area, :presence => true
end
