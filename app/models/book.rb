class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image

  enum evaluation: { poor: 0, bad: 1, good: 2, very_good: 3, excellent: 4 }
end
