Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:show, :edit, :update] do
  		collection do
  		   # get 'leave'
         get  "leave"
         patch "active_leave"
  		end
  end

  resources :items, only: [:index, :show] do
      member do
        get 'searched_index'
      end
  end

  resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create] do
    collection do
      post 'confirm'
      get 'confirm'
      get 'complete'
    end
  end

  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'all_destroy'
    end
  end

  namespace :admin do
    get 'homes/top'
    devise_for :admins, controller: { sessions: 'admin/sessions', registrations: 'admin/registrations', passwords: 'admin/passwords'}

    resources :users, only: [:index, :show, :edit, :update] do
    	member do
    		get 'order_index'
    	end
    end

    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:index, :edit, :update]
    resources :order_items, only: [:update]
  end
end
