Rails.application.routes.draw do
  root "homes#top"

  devise_for :users

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  
  
end
