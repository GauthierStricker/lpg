class SleepLog < ApplicationRecord
  belongs_to :daily_journey
  belongs_to :area
end
