# encoding: utf-8

Failbank::Application.routes.draw do
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users

  resources :fails do
    resources :comments
  end
   
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
end