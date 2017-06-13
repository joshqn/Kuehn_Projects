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
    get 'users/:id/new', to: 'projects#new', as: :project_new
    delete '/projects/:id', to: 'projects#destroy', as: :project_delete
    get '/projects/:id/edit', to: 'projects#edit', as: :project_edit
  end

end
