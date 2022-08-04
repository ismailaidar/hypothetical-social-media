class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rater, class_name: "User"

  validates :stars, length: { maximum: 5, minimum: 0 }
end
