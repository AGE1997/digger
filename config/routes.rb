Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  # get 'videos(/:id)', to: 'videos#index'
  root to: "homes#index"
  resources :videos do
    collection do
      get 'search'
    end
    resources :orders, only: [:new, :create]
  end
  resources :profiles, only: [:edit, :update]
end