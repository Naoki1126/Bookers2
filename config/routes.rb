Rails.application.routes.draw do
  
  devise_for :users
  

  resources :books
  resources :users, only: [:show, :edit, :index, :update]
  resources :homes, only: [:home]
  
  get 'home/about' => 'homes#about'
  root 'homes#home'

end

  # For details onra the DSL available within this file, see http://guides.rubyonrails.org/routing.html
