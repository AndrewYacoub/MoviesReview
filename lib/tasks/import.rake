require 'csv'

namespace :import do
    desc "Import movies and reviews from CSV files"
    task movies_and_reviews: :environment do
        movies_csv_path = Rails.root.join('lib', 'tasks', 'data', 'movies.csv')
        reviews_csv_path = Rails.root.join('lib', 'tasks', 'data', 'reviews.csv')

        CSV.foreach(movies_csv_path, headers: true) do |row|
            movie = Movie.find_or_create_by(title: row['Movie'], description: row['Description'], year: row['Year'], director: row['Director'])
            actor = Actor.find_or_create_by(name: row['Actor'])
            location = FilmingLocation.find_or_create_by(location: row['Filming location'], country: row['Country'])
          
            MovieActor.find_or_create_by(movie: movie, actor: actor)
            MovieLocation.find_or_create_by(movie: movie, filming_location: location)
          end
          
          CSV.foreach(reviews_csv_path, headers: true) do |row|
            movie = Movie.find_by(title: row['Movie'])
            if movie
              movie.reviews.create(user: row['User'], stars: row['Stars'], review_text: row['Review'])
            else
              puts "Movie not found for review: #{row['Movie']}"
            end
          end
          
    end
  end