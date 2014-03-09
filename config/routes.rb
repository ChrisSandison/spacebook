Spacebook::Application.routes.draw do
  root "home#index"

  resources :users
  resources :spaces do
    resources :reviews
    resources :events
    get :contact, on: :member
    post :send_email, on: :member
  end

  resources :sessions, only: [:new, :create, :destroy]

end
