Spacebook::Application.routes.draw do
  root "home#index"

  resources :users
  resources :spaces do
    resources :reviews
  end

  resources :sessions, only: [:new, :create, :destroy]

end
