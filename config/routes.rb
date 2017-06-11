Rails.application.routes.draw do
  resources :users



  resources :projects
  root 'projects#index'
  get '/ios/:type', to: 'projects#type'
  get '/web/:type', to: 'projects#type'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope '/admin' do
    get 'users/:id', to: 'users#show', as: :admin
    get 'users/:id/new', to: 'users#new', as: :admin_new
  end

end
