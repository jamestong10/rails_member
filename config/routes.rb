Rails.application.routes.draw do
  root 'products#index'
  get '/products', to: 'products#index', as: 'products'
  get '/product/:id', to: 'products#show', as: 'product'

  devise_for :users
  namespace :admin do
    resources :products
    get '/users', to: 'users#index', as: 'users'
    post '/approve/:id', to: 'users#approve', as: 'approve'
    post '/disapprove/:id', to: 'users#disapprove', as: 'disapprove'
  end

end
