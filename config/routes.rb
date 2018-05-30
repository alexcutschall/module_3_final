Rails.application.routes.draw do
  root "welcome#index"

  get '/validate', to: 'search#show', as: 'validate'

end
