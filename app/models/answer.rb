class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true
end
