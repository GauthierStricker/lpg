class MoneyLog < ApplicationRecord

  # Relationships
  belongs_to :area, optional: true
  belongs_to :daily_journey

  # Validations
  validates :daily_journey, :date, :gained_money, :spent_money, :presence => true
end
