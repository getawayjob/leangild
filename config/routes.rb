Leangild::Application.routes.draw do

  resources :invitations, only: [:create, :destroy]
  resources :startups
 
  devise_for :users
  resources :users, only: [:index, :show]
  devise_scope :user do
    match '/signup', :to => "devise/registrations#new"
    match '/signin', :to => "devise/sessions#new"
  end
  
  root to: 'pages#home'
end
