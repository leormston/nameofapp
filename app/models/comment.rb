class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates :user_id, presence: true
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }
end
