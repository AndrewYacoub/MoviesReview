Rails.application.routes.draw do
  root 'movies#index' # Set the movies index as the homepage or...
  resources :movies, only: [:index] # if you prefer to keep it under /movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
