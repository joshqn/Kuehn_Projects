Rails.application.routes.draw do
  resources :users



  resources :projects
  root 'projects#index'
  get '/:type', to: 'projects#type'

  scope '/admin' do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get 'users/:id', to: 'users#show'
  end

end
