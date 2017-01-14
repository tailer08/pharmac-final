Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#login'
  get  '/home',      to: 'static_pages#home'
  get  '/help',      to: 'static_pages#help'
  get  '/about',     to: 'static_pages#about'
  get  '/howto_add',     to: 'static_pages#howto_add'
  get  '/howto_search',     to: 'static_pages#howto_search'
  get  '/howto_signup',     to: 'static_pages#howto_signup'
  get  '/whatfor',     to: 'static_pages#whatfor'
  get  '/signup',    to: 'users#new'
  get  '/dashboard', to: 'dashboard#index'
  get  '/login',     to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  
  #medicine routes
  get '/medicine', to: 'medicine#index'
  post '/medicine',  to: 'medicine#index'
  post '/medicine_new', to: 'medicine#new'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/sortStock', to: 'dashboard#stockSort'
  get '/sortBrand',  to: 'dashboard#brandSort'
  get '/sortPrice',  to: 'dashboard#priceSort'
  get '/medicine_show', to: 'medicine#show'
  
  get '/create_med', to: 'medicine#index'
  post '/addStock' , to: 'stocks#addNew'
  post '/subStock' , to: 'stocks#subNew'
  post '/createMed', to: 'medicine#createMed'
  
  resources :users
  resources :stocks
  resources :stock
  resources :medicine
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end