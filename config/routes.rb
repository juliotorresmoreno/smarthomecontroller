Rails.application.routes.draw do
  resources :posts
  get 'home', to: 'home#index' 
  
  get 'publicacion' => 'publicacion#index'
  get 'publicacion/new' => 'publicacion#new'
  post 'publicacion/create' => 'publicacion#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
