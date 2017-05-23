Rails.application.routes.draw do
  resources :hacker_quotes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'hacker_quotes#index'

  get 'search', to: 'hacker_quotes#search'
end
