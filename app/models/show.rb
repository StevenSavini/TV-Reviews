class Show < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :average_rating, presence: true

  has_many :reviews
end
