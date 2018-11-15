Rails.application.routes.draw do
  devise_for :users
  resources :meals do

  end
  resources :meal_dates, except: [ :show ] do
    resources :orders, only: [ :index, :show, :update ]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# new
# create
# index
# show
# edit
# patch
# delete

# can see all meal_dates
# can show one meal dates? NO
# meal date new => yes, admin
# can create a new meal date => yes, admin
# can edit a meal and update a meal => yes, admin
# can delete a meal date => yes admin

