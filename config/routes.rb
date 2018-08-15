Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  
  resources :users
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


end