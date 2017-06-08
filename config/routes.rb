Rails.application.routes.draw do
  resources :projects
  root 'projects#index'
  get '/:type', to: 'projects#type'

end
