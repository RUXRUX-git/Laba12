Rails.application.routes.draw do
  root 'mersenne_numbers#index'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  resources :mersenne_numbers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
