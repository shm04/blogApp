Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  # authenticated :user do
  #   root to: 'users#index', as: :authenticated_root
  # end

  # unauthenticated do
  #   root to: 'devise/sessions#new', as: :unauthenticated_root
  # end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create, :destroy]

      member do
        post 'likes', to: 'likes#create'
      end
    end

    get 'posts/page/:page', to: 'posts#index', on: :member, as: 'posts_page'
  end

  delete '/likes/:id', to: 'likes#destroy', as: 'like'

  post '/comments', to: 'comments#create', as: 'create_comment'
end