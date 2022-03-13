Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
  resources :categories
  resources :words
  resources :answers
  resources :sessions, only: [:create, :destroy]
  resources :users, except: :new
  resources :lessons do
    resources :answers
  end

  namespace :admin do
    resources :users do
      member do
        patch :set, :remove
      end
    end
    resources :categories do
      resources :words
    end
  end
end
