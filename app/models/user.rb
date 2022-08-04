class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def rating
    Rating.where(user: self).average(:stars).to_f
  end
end
