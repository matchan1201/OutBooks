class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum evaluation: { poor: 0, bad: 1, good: 2, very_good: 3, excellent: 4 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
