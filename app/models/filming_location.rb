class FilmingLocation < ApplicationRecord
  has_many :movie_locations
  has_many :movies, through: :movie_locations

  validates :location, presence: true
  validates :country, presence: true
end
