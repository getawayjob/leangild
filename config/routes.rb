Leangild::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :startups
  
  devise_for :users
  devise_scope :user do
    match '/signup', :to => "devise/registrations#new"
    match '/signin', :to => "devise/sessions#new"
  end
  
  root to: 'pages#home'
end
