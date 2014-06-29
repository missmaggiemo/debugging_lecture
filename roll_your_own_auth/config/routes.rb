Links::Application.routes.draw do

  root 'sessions#new'

  resources :users
  
  resources :links
  
  resources :links do 
  
    resources :comments
  
  end
  
  
  resource :session


end
