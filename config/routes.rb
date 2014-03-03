Spacebook::Application.routes.draw do
  root "home#index"

  resources :users
  resources :spaces

  resources :sessions, only: [:new, :create, :destroy]

end
