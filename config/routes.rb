Rails.application.routes.draw do
  # get 'users/show'
  
  # get 'items/new'
  
  # get 'items/create'
  
  root to: "main#index"
    devise_for :users

  
  #devise_for :users, :controllers=> {registrations: 'registrations'}
  
  # root to: "users#show"
  #   resources :users, only: [:show] do
  #     resources :items, only: [:create, :destroy]
  #   end
  
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end
  

end
