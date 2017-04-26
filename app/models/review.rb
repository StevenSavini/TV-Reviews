class Review < ApplicationRecord
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: { in: 1..5 }

  belongs_to :show
  belongs_to :user
  has_many :votes
end
