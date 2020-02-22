class Question < ApplicationRecord

  belongs_to :resort
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :question, presence: true
  
end
