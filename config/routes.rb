Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
