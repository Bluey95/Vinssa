Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :drugs
  devise_for :users, :controllers => {:registrations => "registrations", :users => "users"}
  match 'orders/:id' => 'orders#send_email', :via => :post, :as => :send_order_received_email
  get 'user/:id' => 'users#show'
  get 'users' => 'users#index'
  get 'users/suppliers' => 'users#supplier', :as => :users_suppliers
  put 'users/admin/:id' => 'users#update_admin', :as => :update_admin
  put 'users/supplier/:id' => 'users#update_as_supplier', :as => :update_supplier
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root 'drugs#index'
  resources :users_admin, :controller => 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
