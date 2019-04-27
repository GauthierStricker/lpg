class Area < ApplicationRecord

  # Relationships
  belongs_to :hero

  # Validations
  validates :hero, :name, :presence => true
end
