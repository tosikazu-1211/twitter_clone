Rails.application.routes.draw do

  get 'comments/create'
  get 'comments/destroy'

	root 'tweets#index'

  devise_for :users

  resources :tweets do
  	resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    get :search, on: :collection
  end

  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
    get :search, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
