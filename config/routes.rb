Rails.application.routes.draw do
  resources :resorts do
     resources :questions, only: [:create, :show]

    get 'favorites', to: 'favorites#create', as: 'create_favorite'
    get 'favorites/delete', to: 'favorites#destroy', as: 'delete_favorite'

  end


  resources :questions, only: [] do
    resources :answers, only: [:create]
  end
  # resources :questions do
  #   member do
  #     post "answers", to: "answers#create"
  #   end
  # end

  # post "resorts/:id/questions", to: "questions#create"
  # post "resorts/:id/questions/:id/answers", to: "answers#create"

  #   member do
  #     post "questions", to: "resorts#create_question"
  #     member do
  #       post "answers", to: "resorts#create_answer"
  #     end
  #   end

  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home', as: 'home'

  get 'resorts/:id/ticket', to: 'pages#ticket', as: 'ticket'
  get 'resorts/:id/share', to: 'pages#share', as: 'share'
  get 'resorts/:id/itinerary', to: 'pages#itinerary', as: 'itinerary'

end
