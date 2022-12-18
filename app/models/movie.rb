class Movie < ApplicationRecord
  has_many :bookmarks
  validates :name, uniqueness: true
  validates :overview, presence: true
end
