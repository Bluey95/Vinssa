Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'user/:id' => 'users#show'
  get 'users' => 'users#index'
  resources :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
