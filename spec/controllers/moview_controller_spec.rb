require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    before do
      Movie.create(title: "Test Movie", description: "A test movie.", year: 2020, director: "Test Director")
    end

    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @movies" do
      get :index
      expect(assigns(:movies)).not_to be_empty
    end
  end
end