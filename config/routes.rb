# encoding: utf-8

Failbank::Application.routes.draw do
  
  resources :fails

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end