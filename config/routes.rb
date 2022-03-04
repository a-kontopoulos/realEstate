Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#index'
  get 'static_pages/services'
  get 'static_pages/contact'

  resources :users
  #route to signup new user
  get 'signup', to: 'users#new'

end
