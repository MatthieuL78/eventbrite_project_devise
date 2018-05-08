Rails.application.routes.draw do
  root 'staticpages#home'
  
  get 'event_payement/:id', to: 'events#show_payement', as: :subscribe_show
  get 'event_payement/:id', to: 'events#create_payement', as: :payement_create
  #get 'payement_succeed/:id', to: 'events#show_payement', as: :payement_done
  get 'payement_succeed/:id', to: 'events#payment_succeed', as: :payement_succeed
  post 'event_payement/:id', to: 'events#subscribe', as: :subscribe	
  
  resources :events
  devise_for :users
  resources :users, only: [:show]
end
