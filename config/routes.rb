Rails.application.routes.draw do
  root 'static_pages#login'
  get  '/home',  to: 'static_pages#home'
  get  '/help',  to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/signup',to: 'users#new'
  get  '/login', to: 'static_pages#login'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
