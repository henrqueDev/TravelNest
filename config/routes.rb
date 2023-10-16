Rails.application.routes.draw do
  get 'homepage', to: 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hotels, only: [:index, :show]
  
  post 'payments/create', to: 'payments#create'
  get '/payments/:url', to: 'payments#show_by_url', as: 'show_by_url_payment'
end
