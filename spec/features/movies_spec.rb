require 'rails_helper'

RSpec.feature "Movies", type: :feature do
  scenario "User visits the movies index page" do
    Movie.create(title: "Test Movie", description: "A test movie.", year: 2020, director: "Test Director")
    visit movies_path
    expect(page).to have_text("Test Movie")
  end

end
