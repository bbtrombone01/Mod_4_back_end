Rails.application.routes.draw do
  resources :collections
  resources :users
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
