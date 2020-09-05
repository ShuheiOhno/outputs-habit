Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: [:index ,:show]

  resources :posts do
    member do
      get 'post_list'
      get 'another_user_post_list'
    end
    resources :likes, only: [:create, :destroy]
    resources :tags, only: [:index, :search]
    resources :comments, only: [:destroy, :show, :edit, :update, :create]
    collection do
      get 'search'
    end
  end
end
