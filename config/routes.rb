Rails.application.routes.draw do
  root 'staticpages#home'
  post 'subscribe/:id', to: 'events#subscribe', as: :subscribe	
  resources :events
  resources :charges, only: [:new, :create]
  devise_for :users
  resources :users, only: [:show]
end
