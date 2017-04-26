class Vote < ApplicationRecord
   belongs_to :user
   belongs_to :review

   validates :value, numericality: true
   validates :value, inclusion: { in: -1..1 }
end
