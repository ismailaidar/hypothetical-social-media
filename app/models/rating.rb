class Rating < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :rater, class_name: "User"

  validates :stars, numericality: { in: 0..5 }
  validates :user, uniqueness: { scope: :rater }


end
