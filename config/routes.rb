
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :profiles, only: %i[new create]
  end
  get '/teams/mates', to: 'teams#mates', as: 'mates'
  resources :teams, only: %i[show new create] do
    get '/review', to: 'teams#review'
    resources :team_reviews, only: %i[new create]
    resources :user_reviews, only: %i[new create]
  end
end
