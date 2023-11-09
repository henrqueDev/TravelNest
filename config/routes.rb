Rails.application.routes.draw do
  devise_for :users
  root to: "homepage#index" 
  get 'homepage', to: 'homepage#index'
  resources :hotels, only: [:index, :show]
  
  post 'payments/create', to: 'payments#create'
  get '/payments', to: 'payments#show', as: 'show'

end
