class Question < ApplicationRecord
  attr_accessor :question
  belongs_to :resort
  belongs_to :user
  has_many :answers, dependent: :destroy
  
end
