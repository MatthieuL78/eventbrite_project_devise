Rails.application.routes.draw do
  root 'staticpages#home'
  resources :users, only: [:show]
  resources :events, :event_attendees
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
