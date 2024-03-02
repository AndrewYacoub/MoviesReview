require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'calculates average stars' do
    it 'returns the correct average' do
      movie = create(:movie) # Use the factory for movie
      create(:review, movie: movie, stars: 4)
      create(:review, movie: movie, stars: 5)
      expect(movie.average_stars).to eq 4.5
    end
  end
end
