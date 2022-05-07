Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end

  root to: "homes#index"
  resources :videos do
    collection do
      get 'search'
    end
    resources :orders, only: [:new, :create]
    resources :comments, only: [:create]
  end
  resources :profiles, only: [:show, :edit, :update]
end