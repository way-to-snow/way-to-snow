class Resort < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :questions, dependent: :destroy
  has_many :forecasts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :weather_reports, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def conditions
    forecasts.map(&:condition)
  end
end
