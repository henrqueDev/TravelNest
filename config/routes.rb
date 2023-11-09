Rails.application.routes.draw do
  get 'homepage', to: 'homepage#index'
  get 'filter/get_states'
  get 'filter/get_cities'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hotels, only: [:index, :show]
  
  post 'payments/create', to: 'payments#create'
  get '/payments', to: 'payments#show', as: 'show'
end
