Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :ingredients
  resources :favorites
  resources :recipes
  resources :users
  post '/login', to: 'login#create', as: 'login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
