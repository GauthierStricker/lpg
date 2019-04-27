class ChallengeLog < ApplicationRecord
  belongs_to :challenge
  belongs_to :daily_journey
end
