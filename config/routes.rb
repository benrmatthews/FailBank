# encoding: utf-8

Failbank::Application.routes.draw do
 # root to: 'static_pages#home'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/blog',    to: 'static_pages#blog'
  match '/faq',     to: 'static_pages#faq'
  match '/privacy', to: 'static_pages#privacy'
  match '/terms',   to: 'static_pages#terms'
  match '/contact', to: 'static_pages#contact'
  
  
  get 'tags/:tag', to: 'fails#index', as: :tag
    
  authenticated :user do
    root :to => 'fails#index'
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
  
  resources :tags
  resources :relationships, only: [:create, :destroy]
end