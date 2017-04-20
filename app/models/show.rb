class Show < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :average_rating, presence: true

end
