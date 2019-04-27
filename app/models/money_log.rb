class MoneyLog < ApplicationRecord

  # Relationships
  belongs_to :area
  belongs_to :daily_journey

  # Validations
  validates :daily_journey, :area, :date, :gained_money, :spend_money :presence => true
end
