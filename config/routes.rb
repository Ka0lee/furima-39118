Rails.application.routes.draw do


  devise_for :users
  root to: 'items#index'
  resources :items, only:[:index, :new, :create,:show, :destroy]
  resources :articles,only:[:index, :new, :create]


end
