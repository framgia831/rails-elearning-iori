Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/dashboard', to: 'dashboard#index'
  get '/words', to:'words#index'
  
  resources :users do 
      member do 
          get 'followers', 'following'
          delete 'followes', 'following'
      end
  end 
  
  resources :sessions
  resources :categories
  
  Rails.application.routes.draw do 
  	namespace :admin do 
  		resources :users
  		resources :categories do 
        resources :words
      end
  	end

    resources :lessons do
      resources :lesson_words
    end 
  end

  resources :relationships, only: [:create, :destroy]


end