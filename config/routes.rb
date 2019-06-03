
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :profiles, only: %i[new create]
  end

  resources :teams, only: %i[show new create] do
    get '/mates', to: 'team_memberships#mates', as: 'mates'
    resources :team_memberships, only: %i[create destroy]
    get '/review', to: 'teams#review'
    resources :team_reviews, only: %i[new create]
    resources :user_reviews, only: %i[new create]
  end
end
