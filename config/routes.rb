Rails.application.routes.draw do
  # Root
  root 'pages#homepage'

  # Register
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # Login
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  # Logout
  get  '/logout', to: 'sessions#destroy'
  resources :users

  # Pages
  get '/contact', to: 'pages#contact'
  get '/help',    to: 'pages#help'
  get '/home',    to: 'pages#homepage'

  # get 'articles(.:id)/comments(.:id)'
  resources :articles do
    resources :comments
  end
end
