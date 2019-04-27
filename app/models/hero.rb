class Hero < ApplicationRecord

  # Relationships
  belongs_to :user
  has_many :challenges, dependent: :destroy
  has_many :quests, dependent: :destroy
  has_many :daily_journeys, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :habits, dependent: :destroy
  has_many :tasks, dependent: :destroy

  # Validations
  validates :user, :name, :weight, :total_money, :presence => true
end
