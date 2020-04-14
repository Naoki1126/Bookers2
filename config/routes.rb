Rails.application.routes.draw do
  
  devise_for :users
  

  resources :books do
  	resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update] 
  resources :relationships, only: [:create, :destroy]
  resources :homes, only: [:home]
  get '/search' => 'search#search'
  get 'users/:id/follows' => 'relationships#follows'
  get 'users/:id/followers' => 'relationships#followers'
  get 'home/about' => 'homes#about'
  root 'homes#home'

  
end


  # For details onra the DSL available within this file, see http://guides.rubyonrails.org/routing.html
