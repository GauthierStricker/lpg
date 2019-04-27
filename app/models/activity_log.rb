class ActivityLog < ApplicationRecord

  #Relationships
  belongs_to :area
  belongs_to :daily_journey

  #Validations
  validates :daily_journey, :date, :presence => true
end
