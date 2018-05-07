Rails.application.routes.draw do
  root 'staticpages#home'
  resources :events
  devise_for :users
  resources :users, only: [:show]
end
