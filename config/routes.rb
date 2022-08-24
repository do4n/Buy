Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      resources :variants
    end
    # resources :variant_properties
    resources :properties
    resources :categories
  end

  resources :products, only: %i[show index]

  root "products#index"
end
