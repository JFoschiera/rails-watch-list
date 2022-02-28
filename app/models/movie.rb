class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true
  validates :title, :overview, presence: true
  validates :overview, length: { maximum: 400 }

end
