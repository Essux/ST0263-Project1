class Location < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
