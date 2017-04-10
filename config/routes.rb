Rails.application.routes.draw do
  resources :users_descs
  resources :users
  resources :states
  resources :sessions
  resources :schedules
  resources :recovery_passwords
  resources :petitions_trackings
  resources :petitions
  resources :petition_types
  resources :permissions
  resources :perfils
  resources :parameters_values
  resources :parameters
  resources :operations
  resources :locations
  resources :incidences_trackings
  resources :incidences
  resources :incidence_types
  resources :devices
  resources :countries
  resources :consumptions
  resources :conditions
  resources :components
  resources :cities
  resources :posts
  get 'home', to: 'home#index' 
  
  get 'publicacion' => 'publicacion#index'
  get 'publicacion/new' => 'publicacion#new'
  post 'publicacion/create' => 'publicacion#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
