Rails.application.routes.draw do
  resources :resorts do

    get 'favorites', to: 'favorites#create', as: 'create_favorite'
    get 'favorites/delete', to: 'favorites#destroy', as: 'delete_favorite'

  end
  devise_for :users
  root to: 'pages#home'

  get 'resorts/:id/ticket', to: 'pages#ticket', as: 'ticket'
end
