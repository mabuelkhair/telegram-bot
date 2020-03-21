Rails.application.routes.draw do
  root 'conversations#index'
  resources :messages, only: [:create]
  resources :conversations, only: [:index, :show]
end
