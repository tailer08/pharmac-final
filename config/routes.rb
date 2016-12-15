Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#login'
  get  '/home',      to: 'static_pages#home'
  get  '/help',      to: 'static_pages#help'
  get  '/about',     to: 'static_pages#about'
  get  '/signup',    to: 'users#new'
  get  '/dashboard', to: 'dashboard#index'
  get  '/login',     to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  post '/medicine',  to: 'medicine#new'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/sortStock', to: 'dashboard#stockSort'
  get '/sortBrand',  to: 'dashboard#brandSort'
  get '/sortPrice',  to: 'dashboard#priceSort'
  get '/medicine_show', to: 'medicine#show'
  
  get '/create_med', to: 'dashboard#createMedicine'
  post '/addStock' , to: 'stocks#addNew'
  post '/subStock' , to: 'stocks#subNew'
  
  resources :users
  resources :stocks
  resources :stock
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
