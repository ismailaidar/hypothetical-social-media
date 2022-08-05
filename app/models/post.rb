class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  self.per_page = 3
end
