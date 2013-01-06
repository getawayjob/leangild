Leangild::Application.routes.draw do

  resources :updates, only: [:index, :create, :destroy]

  resources :invitations, only: [:create, :destroy]
  match 'bulk_invite', :to => 'invitations#bulk_invite'
   
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  devise_scope :user do
    match '/signup', :to => 'devise/registrations#new', as: 'signup'
    match '/signin', :to => 'devise/sessions#new', as: 'signin'
  end

  resources :startups
  resources :users, only: [:index, :show]

  match '/hashgild', :to => 'pages#hashgild'
  match '/activity', :to => 'pages#activity'	
  match '/dashboard', :to => 'pages#dashboard'
  root :to => 'pages#home'
end
