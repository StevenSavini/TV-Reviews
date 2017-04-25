class Show < ApplicationRecord
   validates :title, presence: true
   validates :description, presence: true

   validates :average_rating, numericality: true, allow_blank: true
   validates :average_rating, inclusion: { in: 1..5 }, allow_blank: true

   has_many :reviews
end
