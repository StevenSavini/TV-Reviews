class Show < ApplicationRecord
  validates :title, presence: true

  validates :average_rating, numericality: true, allow_blank: true
  validates :average_rating, inclusion: { in: 1..5 }, allow_blank: true

  has_many :favorites
  has_many :users, through: :favorites
  has_many :reviews

  def self.average_rating_calc(show)
    rating_total = 0
    if !show.nil? && !show.reviews.nil?
      show.reviews.each do |review|
        rating_total += review.rating
      end
      average_rating = rating_total/show.reviews.count.to_f
      show.average_rating = average_rating
      show.save!
    end
  end
end
