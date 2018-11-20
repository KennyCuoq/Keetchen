Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }


  resources :customers, except: [ :new ]do
    member do
    # Route to show customer's order history (where they can review)
      get 'my_orders', to: "customers#my_orders"
    end
    resources :employees, only: [ :create ]
    resources :reviews, only: [:create]
  end

  post "confirm_order", to: "orders#confirm"

  resources :employees, except: [ :new, :edit, :create] do
    member do
      patch 'update_position'
    end
    member do
      patch 'refill_inventory'
    end
  end

  resources :reviews, only: [ :create, :new ]
  resources :meals, except: [ :show, :destroy ]
  resources :meal_dates, except: [ :show, :destroy ] do
    resources :orders, only: [ :index, :show, :create, :update, :new] do
      resources :payments, only: [:new, :create]
    end
  end

  root to: 'pages#home'
end

# namespace :customer do
#   resources :orders, only: [:index]
# end
# "/customer/orders"

# resources  :customer, only: [:show]
# "/customer/:id"

# end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# new
# create
# index
# show
# edit
# update
# delete

# can see all meal_dates
# can show one meal dates? NO
# meal date new => yes, admin
# can create a new meal date => yes, admin
# can edit a meal date and update a meal date => yes, admin
# can delete a meal date => yes admin

