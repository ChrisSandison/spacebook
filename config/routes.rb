Spacebook::Application.routes.draw do
  root "home#index"

  resources :users
  resources :spaces
  resources :reviews

  resources :sessions, only: [:new, :create, :destroy]

end
