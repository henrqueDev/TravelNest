Rails.application.routes.draw do
  devise_for :users
  root to: "homepage#index" 
  get 'homepage', to: 'homepage#index'
  get 'filter/get_states'
  get 'filter/get_cities'
  get 'rooms/get_room'
  get 'room_options/get_room_option'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hotels, only: [:index, :create, :new, :show]
  resources :room_options, only: [:index, :create, :new, :show]
  resources :hotel_reservations, only: [:create]
  
  post 'payments/create', to: 'payments#create'
  get '/payments', to: 'payments#show', as: 'show'

end
