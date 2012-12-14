Leangild::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    match '/signup', :to => "devise/registrations#new"
    match '/signin', :to => "devise/sessions#new"
  end
  
  root to: 'high_voltage/pages#show', id: 'home'
end
