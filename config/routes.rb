Rails.application.routes.draw do
  resources :conversations, only: [:index]
end
