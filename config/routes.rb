
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :profiles, only: %i[new create]
  end

  resources :teams, only: %i[show new create] do
    get '/mates', to: 'team_memberships#mates', as: 'mates'
    get '/random_mates', to: 'team_memberships#random_mates', as: 'random_mates'
    delete '/destroy', to: 'team_memberships#delete', as: 'delete'

    resources :team_memberships, only: %i[create random_mates]
    get '/review', to: 'teams#review'
    resources :team_reviews, only: %i[new create]
    resources :user_reviews, only: %i[new create]
  end
end
