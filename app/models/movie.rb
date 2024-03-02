class Movie < ApplicationRecord
    has_many :movie_actors
    has_many :actors, through: :movie_actors
    has_many :movie_locations
    has_many :filming_locations, through: :movie_locations
    has_many :reviews
    
    def average_stars
        reviews.average(:stars).to_f
    end
end
