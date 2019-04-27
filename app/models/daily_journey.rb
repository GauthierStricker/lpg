class DailyJourney < ApplicationRecord

  # Relationships
  belongs_to :hero
  has_many :meditation_logs, dependent: :destroy
  has_many :mood_logs, dependent: :destroy
  has_many :challenge_logs, dependent: :destroy
  has_many :tasks
  has_many :weight_logs, dependent: :destroy
  has_many :sleep_logs, dependent: :destroy
  has_many :activity_logs, dependent: :destroy

  # Validations
  validates :hero, :date, :locked, :presence => true
end
