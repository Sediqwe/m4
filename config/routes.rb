Rails.application.routes.draw do
  root "games#index"
  resources :games
  get "login", to: "games#index"
  get "registration", to: "games#index"
  get "translater", to: "games#index"
end
