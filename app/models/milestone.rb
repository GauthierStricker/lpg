class Milestone < ApplicationRecord

  # Relationships
  belongs_to :quest

  # Validations
  validates :quest, :name, :acheived, :active, :position, :presence => true
end
