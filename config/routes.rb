Rails.application.routes.draw do
  devise_for :users

  resources :customers, except: [ :new, :index ]do
    collection do
    # Route to show customer's order history (where they can review)
      get 'my_orders', to: "customers#my_orders"
    end
  end
  resources :employees, except: [ :new, :edit, :show ]
  resources :reviews, only: [ :create ]
  resources :meals, except: [ :show, :delete ]
  resources :meal_dates, except: [ :show, :delete ] do
    resources :orders, only: [ :index, :show, :create, :update, :new]
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

