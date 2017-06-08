Rails.application.routes.draw do
  get 'sessions/new'

  resources :projects
  root 'projects#index'
  get '/:type', to: 'projects#type'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
