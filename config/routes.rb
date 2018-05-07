Rails.application.routes.draw do
  root 'staticpages#home'
  resources :events
  resources :charges, only: [:new, :create]
  devise_for :users
  resources :users, only: [:show]
end
