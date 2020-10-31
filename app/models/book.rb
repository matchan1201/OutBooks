class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  with_options presence: true do
  validates :title
  validates :author
  validates :evaluation
  validates :body
  end

  enum evaluation: { poor: 0, bad: 1, good: 2, very_good: 3, excellent: 4 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search,word)
    if search == "forward_match"
      @books = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @books = Book.where("title LIKE?","%#{word}")
    elsif search == "perfect_match"
      @books = Book.where(title:"#{word}")
    elsif search == "partial_match"
      @books = Book.where("title LIKE?","%#{word}%")
    else
      @books = Book.all
    end
end
end
