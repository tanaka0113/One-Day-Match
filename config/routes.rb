Rails.application.routes.draw do
  root "homes#top"

  devise_for :users

  resources :posts do
    collection do
      get :drafts
    end

    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
