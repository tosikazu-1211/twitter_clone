Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
	root 'tweets#index'

  devise_for :users
  resources :tweets
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
