Rails.application.routes.draw do
  devise_for :users
  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy]
  end

  resources :posts do
    resources :comments, only: %i[create new update destroy]
    resources :likes, only: %i[create]
  end
end
