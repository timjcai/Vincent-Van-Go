Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"



  resources :listings do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [ :show ]



end

#get 'reviews/new'
#dashboard route

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 # /bookings/:booking_id/reviews/new

#listing_reviews POST   /listings/:listing_id/reviews(.:format)                                                           reviews#create
# new_listing_review GET    /listings/:listing_id/reviews/new(.:format)
# /listings/2/reviews/new                                                      reviews#new
#  new review page
