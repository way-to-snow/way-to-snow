Rails.application.routes.draw do
  resources :resorts do
    resources :favorites, only: [:create, :index, :destroy]
    resources :questions, only: [:create, :show]
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
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
