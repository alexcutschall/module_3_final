Rails.application.routes.draw do
  root "welcome#index"

  get '/validate', to: 'search#show', as: 'validate'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
