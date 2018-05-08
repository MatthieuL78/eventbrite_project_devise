Rails.application.routes.draw do
  root 'staticpages#home'
  post 'event_payement/:id', to: 'events#subscribe', as: :subscribe	
  get 'event_payement/:id', to: 'events#show_payement', as: :subscribe_show
  get 'event_payement/:id', to: 'events#create_payement', as: :payement_create	
  resources :events
  devise_for :users
  resources :users, only: [:show]
end
