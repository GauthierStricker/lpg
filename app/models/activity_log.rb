class ActivityLog < ApplicationRecord

  #Relationships
  belongs_to :area, optional: true
  belongs_to :daily_journey

  #Validations
  validates :daily_journey, :date, :presence => true

  # Uploading
  mount_uploader :proof, PhotoUploader
end
