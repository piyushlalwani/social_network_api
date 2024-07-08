Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create] do
    resources :groups, only: [:index, :show, :create] do
      resources :posts, only: [:index, :show, :create] do
        resources :likes, only: [:create]
        resources :comments, only: [:index, :create]
      end
    end
    get 'feed', to: 'posts#index', as: 'feed'
  end
end
