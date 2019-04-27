class Quest < ApplicationRecord
  # Relationships
  belongs_to :hero
  belongs_to :area
  has_many :milestones, dependent: :destroy

  # Validations
  validates :hero, :area, :acheived, :active, :name, :presence => true
end
