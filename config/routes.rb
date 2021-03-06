Rails.application.routes.draw do
  devise_for :users
  root :to => "farms#index"
  resources :farms do
    resources :plots do
      resources :product_applications
      resources :plot_problems
      resources :plantations
      resources :crops
    end
  end
  resources :products
  resources :problems
  resources :varieties
  resources :species
  resources :users, except: [:new, :create, :destroy]
  get '/farms/:farm_id/new_user', to: "users_farms#new_user", as: "farm_new_user"
  post '/farms/:farm_id/add_user', to: "users_farms#add_user", as: "farm_add_user"
  post '/farms/:farm_id/destroy_user', to: "users_farms#destroy_user", as: "farm_destroy_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
