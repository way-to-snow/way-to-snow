class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :resort
  validates :resort_id, uniqueness: { scope: :user_id, message: "You already added this resort to your favorites!" }
end
