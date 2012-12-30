Leangild::Application.routes.draw do
  
  
  resources :invitations, only: [:create, :destroy]
  match 'bulk_invite', :to => 'invitations#bulk_invite'

  resources :startups
 
  devise_for :users
  resources :users, only: [:index, :show]
  devise_scope :user do
    match '/signup', :to => 'devise/registrations#new'
    match '/signin', :to => 'devise/sessions#new'
  end

  match '/activity', :to => 'pages#activity'	
  match '/dashboard', :to => 'pages#dashboard'
  root :to => 'pages#home'
end
