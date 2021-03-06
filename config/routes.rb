
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'

  resources :users, only: %i[show] do
    resources :profiles, only: %i[new create]
  end


  get '/complete/:team_id', to: 'teams#complete', as: 'complete'
  resources :teams, only: %i[show new create] do
    get '/mates', to: 'team_memberships#mates', as: 'mates'
    get '/loading', to: 'team_memberships#loading', as: 'loading'
    delete '/destroy', to: 'team_memberships#delete', as: 'delete'

    resources :team_memberships, only: %i[create random_mates]
    get '/review', to: 'teams#review'
    resources :team_reviews, only: %i[new create]
    resources :user_reviews, only: %i[new create]
  end
end
