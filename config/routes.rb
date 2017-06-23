Rails.application.routes.draw do

  get 'contact', to: 'static_pages#contact', as: :contact
  post 'contact', to: 'static_pages#send_message', as: :contact_send

  root 'projects#index'
  get '/ios/:type', to: 'projects#type'
  get '/web/:type', to: 'projects#type'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope '/admin' do
    resources :projects
    get '/', to: 'projects#show', as: :admin
    get '/new', to: 'projects#new', as: :project_new
    post '/new', to: 'projects#create'
    delete '/projects/:id', to: 'projects#destroy', as: :project_delete
    get '/projects/:id/edit', to: 'projects#edit', as: :project_edit
  end

end
