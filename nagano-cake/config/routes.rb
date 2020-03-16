Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
<<<<<<< HEAD
  get 'home/about'
  get 'users' => 'users#leave'
  get 'orders' => 'orders#confirm'
  get 'orders' => 'orders#complete'
  get 'cart_items' => 'cart_items#all_destroy'
  resources :users, only: [:show, :edit, :update, :destroy]
=======
  get 'homes/about'

  resources :users, only: [:show, :edit, :update] do
  		collection do
  		   get 'leave'
  		end
  end
>>>>>>> 7b048d39fd73c8ef5d29f64d0a22e77e4640e735
  resources :items, only: [:index, :show]
  resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy]

  namespace :admin do
<<<<<<< HEAD
    root 'homes#top'
    get 'users' => 'users#order_index'
    resources :users, only: [:index, :show, :edit, :update]
=======
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update] do
    	member do
    		get 'order_index'
    	end
    end

>>>>>>> 7b048d39fd73c8ef5d29f64d0a22e77e4640e735
    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:index, :edit, :update]
  end
end
