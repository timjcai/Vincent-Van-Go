Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'listings', to: 'listings#index'
  get 'listings/new', to: 'listings#new'
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show', as: 'listing'
  get 'listings/:id/edit', to: 'listings#edit', as: 'listing_edit'
  patch 'listings/:id', to: 'listings#update'
  delete 'listings/:id', to: 'listings#destroy'
  get 'listings/:id/bookings', to: 'bookings#index'
  get 'listings/:id/bookings/new', to: 'bookings#new', as: 'bookings'
  post 'listings/:id/bookings', to: 'bookings#create', as: 'listing_bookings'
end
