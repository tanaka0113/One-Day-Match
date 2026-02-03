Rails.application.routes.draw do
  root "homes#top"

  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  
end
