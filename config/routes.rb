Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'listings', to: 'listings#index'
  get 'listings/under100', to: 'listings#under100', as: 'listings_under_100'
  get 'listings/pet_friendly', to: 'listings#pet_friendly', as: 'listings_pet_friendly'
  get 'listings/family', to: 'listings#family', as: 'listings_family'
  get 'listings/fortwo', to: 'listings#fortwo', as: 'listings_fortwo'
  get 'listings/wifi', to: 'listings#wifi', as: 'listings_wifi'
  get 'listings/kitchen_bbq', to: 'listings#kitchen_bbq', as: 'listings_kitchen_bbq'
  get 'listings/shower_bathroom', to: 'listings#shower_bathroom', as: 'listings_shower_bathroom'
  get 'listings/luxury', to: 'listings#luxury', as: 'listings_luxury'
  get 'listings/new', to: 'listings#new'
  get 'listings/my_listings', to: 'listings#mine', as: 'my_listings'
  get 'listings/my_bookings', to: 'bookings#mine', as: 'my_bookings'
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show', as: 'listing'
  get 'listings/:id/reviews', to: 'reviews#index', as: 'listing_reviews'
  get 'listings/:id/reviews/new', to: 'reviews#new', as: 'new_listing_review'
  post 'listings/:id/reviews', to: 'reviews#create', as: 'create_reviews'
  get 'listings/:id/edit', to: 'listings#edit', as: 'listing_edit'
  patch 'listings/:id', to: 'listings#update'
  delete 'listings/:id', to: 'listings#destroy'
  get 'listings/:id/bookings', to: 'bookings#index', as: 'all_bookings'
  get 'listings/:id/bookings/new', to: 'bookings#new', as: 'bookings'
  post 'listings/:id/bookings', to: 'bookings#create', as: 'listing_bookings'
  delete 'listings/:id/bookings', to: 'bookings#destroy', as: 'delete_bookings'
end
