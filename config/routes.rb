Leangild::Application.routes.draw do
  resources :startups
  
  devise_for :users
  devise_scope :user do
    match '/signup', :to => "devise/registrations#new"
    match '/signin', :to => "devise/sessions#new"
  end
  
  root to: 'pages#home'
end
