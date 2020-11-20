Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
	root 'tweets#index'
  devise_for :users

  resources :tweets do
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
