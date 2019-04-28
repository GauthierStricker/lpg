class DailyJourney < ApplicationRecord

  # Relationships
  belongs_to :hero
  has_one :meditation_log#, dependent: :destroy
  has_one :mood_log, dependent: :destroy
  has_one :challenge_log#, dependent: :destroy
  has_one :task
  has_one :weight_log, dependent: :destroy
  has_one :sleep_log, dependent: :destroy
  has_one :activity_log, dependent: :destroy
  has_one :money_log, dependent: :destroy

  # Validations
  validates :hero, :date, :presence => true
end
