Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  get 'videos/index'
  root to: "homes#index"
  resources :videos
end
