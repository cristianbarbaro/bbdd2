Rails.application.routes.draw do
  resources :farms
  resources :products
  resources :problems
  resources :varieties
  resources :species
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
