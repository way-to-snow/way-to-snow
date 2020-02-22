Rails.application.routes.draw do
  resources :resorts do
    resources :favorites, only: [:create, :index, :destroy]
  end
  devise_for :users
  root to: 'pages#home'

  get 'resorts/:id/ticket', to: 'pages#ticket', as: 'ticket'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
