Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :user_reviews, only: %i[new create]
    resources :profiles, only: %i[new create]
    resources :teams, only: %i[show new create]
  end
end
