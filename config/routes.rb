Rails.application.routes.draw do
  resources :users
  resources :users_descs
  root :to => "home#index"
  get 'about', :to => "home#about"
  get 'contact', :to => "home#contact"
  get 'login', :to => "home#login"
  get 'signup', :to => "home#signup"

  post 'signup', :to => "auth#signup"

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
