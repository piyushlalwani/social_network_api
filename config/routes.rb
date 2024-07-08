Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show] do
    resources :posts, only: [:index, :create]
  end

  resources :groups, only: [:create, :index, :show] do
    resources :posts, only: [:index, :create]
  end

  resources :posts, only: [:show, :create] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
