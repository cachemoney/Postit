Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :posts, except: [:delete] do
  	resources :comments, only: [:create]
  end
  
  resources :users, only: [:create, :show]
end
