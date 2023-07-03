Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  resources :groups, only: [:show, :new, :create] do
    resources :products, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
