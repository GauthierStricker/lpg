class SleepLog < ApplicationRecord

  # Relationships
  belongs_to :daily_journey
  belongs_to :area

  # Validations
  validates :daily_journey, :area, :date, :presence => true
end
