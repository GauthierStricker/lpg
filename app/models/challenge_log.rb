class ChallengeLog < ApplicationRecord

  #Relationships
  belongs_to :challenge
  belongs_to :daily_journey

  #Validations
  validates :challenge, :daily_journey, :date, :area, :presence => true
end
