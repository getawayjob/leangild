Leangild::Application.routes.draw do

  resources :updates, only: [:index, :create, :destroy]

  resources :invitations, only: [:create, :destroy]
  match 'bulk_invite', :to => 'invitations#bulk_invite'

  resources :startups
 
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  resources :users, only: [:index, :show]
  devise_scope :user do
    match '/signup', :to => 'devise/registrations#new'
    match '/signin', :to => 'devise/sessions#new'
  end

  match '/hashgild', :to => 'pages#hashgild'
  match '/activity', :to => 'pages#activity'	
  match '/dashboard', :to => 'pages#dashboard'
  root :to => 'pages#home'
end
