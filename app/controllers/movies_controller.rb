class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:actors, :reviews, :filming_locations)
    if params[:search].present?
      @movies = @movies.joins(:actors).where('actors.name LIKE ?', "%#{params[:search]}%").distinct
    else
      @movies = @movies.left_joins(:reviews)
                     .select('movies.*, AVG(reviews.stars) as average_stars')
                     .group('movies.id')
                     .order('average_stars DESC')
    end
  end
end
