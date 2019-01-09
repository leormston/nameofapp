class Product < ApplicationRecord
  has_many :comments
  validates :name, presence: true
  def highest_rating_comment
    comments.rating_desc.first
  end
end
