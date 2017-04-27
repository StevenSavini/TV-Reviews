class Show < ApplicationRecord
   validates :title, presence: true
   validates :description, presence: true

   validates :average_rating, numericality: true, allow_blank: true
   validates :average_rating, inclusion: { in: 1..5 }, allow_blank: true

   has_many :favorites
   has_many :users, through: :favorites
   has_many :reviews

   def self.search(search)
   where("title ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
   end
end
