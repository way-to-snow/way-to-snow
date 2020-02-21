Rails.application.routes.draw do
  resources :resorts do
    resources :favorites, only: [:create, :index, :destroy]
    resources :questions, only: [:create, :show, :update] do
      resources :answers, only: :create
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
