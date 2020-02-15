class Resort < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :forecasts, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
