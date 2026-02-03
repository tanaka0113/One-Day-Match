class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  enum status: { draft: 0, published: 1 }
end
