Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  # get 'users/:id', to: 'users#edit', as: 'edit_user'
  # get 'users/new', to: 'users#new' , as: 'new_user'
  # get '/users/:viewer_id/artworks', to: 'artworks#index'
  
  # resources :users do
  #   resources :artworks, only: :index
  # end

  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:index, :create, :show, :update, :destroy] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]
  
  resources :comments, only: [:create, :destroy]
end
