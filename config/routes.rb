Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :profiles, only: %i[new create]
    resources :teams, only: %i[new create]
  end
  resources :teams, only: %i[show] do
    resources :user_reviews, only: %i[new create]
  end
end
