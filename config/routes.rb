Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages
  get "app", to: "messages#index"
  root to: 'home#index'

  mount ActionCable.server => '/cable'
end
