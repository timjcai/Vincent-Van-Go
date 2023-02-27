Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'listings', to: 'listings#index'
  get 'listings/new', to: 'listings#new'
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show'
  get 'listings/:id/edit', to: 'listings#edit'
  patch 'listings/:id', to: 'listings#update'
  delete 'listings/:id', to: 'listings#destroy'
end
