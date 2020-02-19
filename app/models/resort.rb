class Resort < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :forecasts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :weather_reports, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
