class Challenge < ApplicationRecord

  #Relationships
  belongs_to :hero
  belongs_to :area
  has_many :challenge_logs

  #Validations
  validates :hero, :name, :presence => true
end
