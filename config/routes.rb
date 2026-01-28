Rails.application.routes.draw do
  root "homes#top"
  resources :posts, only: [:index, :new, :create]
end

