class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image
  has_many :book_comments

  enum evaluation: { poor: 0, bad: 1, good: 2, very_good: 3, excellent: 4 }
end
