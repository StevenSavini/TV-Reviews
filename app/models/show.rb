class Show < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :average_rating, presence: true
  validates :average_rating, numericality: true
  validates :average_rating, inclusion: { in: 1..5 }
end
