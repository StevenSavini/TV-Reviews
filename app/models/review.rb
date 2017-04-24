class Review < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true

  belongs_to :show
  belongs_to :user
end
