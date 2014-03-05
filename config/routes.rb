Spacebook::Application.routes.draw do
  root "home#index"

  resources :users
  resources :spaces do
    resources :reviews
    resources :events
  end

  resources :sessions, only: [:new, :create, :destroy]

end
