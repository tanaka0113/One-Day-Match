Rails.application.routes.draw do
  root "homes#top"

  devise_for :users

  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
  
end
