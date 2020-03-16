Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about'
  get 'users' => 'users#leave'
  get 'orders' => 'orders#confirm'
  get 'orders' => 'orders#complete'
  get 'cart_items' => 'cart_items#all_destroy'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :items, only: [:index, :show]
  resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy]

  namespace :admin do
    root 'homes#top'
    get 'users' => 'users#order_index'
    resources :users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:index, :edit, :update]
  end
end
