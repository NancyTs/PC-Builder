Rails.application.routes.draw do
  devise_for :users
  resources :computers
  get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'computers#index'
  get '/search' => 'home#search'
  get :autocomplete, to: 'home#autocomplete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
