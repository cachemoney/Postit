Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :posts, except: [:delete] do
    # POST /posts/:id/vote => 'posts#vote'
    member do
      post 'vote'
    end

  	resources :comments, only: [:create] do
      # POST /comments/:id/vote => 'posts#vote
      member do
        post 'vote'
      end
    end
    
  end
  
  resources :users, only: [:create, :show]

  resources :categories, only: [:create, :index, :new, :show]
end
