Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'listings', to: 'listings#index'
  get 'listings', to: 'listings#under100', as: 'listings_under_100'
  get 'listings/new', to: 'listings#new'
  get 'listings/my_listings', to: 'listings#mine', as: 'my_listings'
  get 'listings/my_bookings', to: 'bookings#mine', as: 'my_bookings'
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show', as: 'listing'
  get 'listings/:id/edit', to: 'listings#edit', as: 'listing_edit'
  patch 'listings/:id', to: 'listings#update'
  delete 'listings/:id', to: 'listings#destroy'
  get 'listings/:id/bookings', to: 'bookings#index', as: 'all_bookings'
  get 'listings/:id/bookings/new', to: 'bookings#new', as: 'bookings'
  post 'listings/:id/bookings', to: 'bookings#create', as: 'listing_bookings'
  delete 'listings/:id/bookings', to: 'bookings#destroy', as: 'delete_bookings'
end
