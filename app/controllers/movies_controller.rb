class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = Movie.joins(:actors).where('actors.name LIKE ?', "%#{params[:search]}%").distinct
    else
      @movies = Movie.left_joins(:reviews)
                     .select('movies.*, AVG(reviews.stars) as average_stars')
                     .group('movies.id')
                     .order('average_stars DESC')
    end
  end
end
