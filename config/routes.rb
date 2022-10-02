Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      resources :variants, only: :index
    end
    # resources :variant_properties
    resources :properties
    resources :categories
    resources :variants, only: %i[update destroy]
  end

  resources :products, only: %i[show index]

  root "products#index"
end
