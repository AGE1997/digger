Rails.application.routes.draw do
  devise_for :users
  get 'videos/index'
  root to: "videos#index"
end
