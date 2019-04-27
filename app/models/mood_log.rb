class MoodLog < ApplicationRecord
  belongs_to :daily_journey
  belongs_to :area
end
