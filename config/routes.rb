Rails.application.routes.draw do



  get 'notifications/link_through'

  resources :projects do
    resources :tracks
  end

  resources :projects do
    resources :collaborations
  end

  resources :requests do
    post :reject_collab
  end

  resources :requests do
    post :approve_collab
  end

  resources :requests do
    post :approve_mix
  end

  resources :requests do
    post :reject_mix
  end

  resources :projects do
    resources :requests
  end

  resources :projects do
    resources :comments
  end

  resources :projects do
    resources :blacklists
  end

  resources :projects do
    resources :branches
  end

  resources :branches do
    resources :requests
  end
  
  resources :branches do
    resources :tracks
  end

  resources :branches do
    resources :comments
  end

  resources :branches do
    resources :blacklists
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resource :user do
    resources :notifications
    get 'notification/:id/link_through', to: 'notifications#link_through', as: :link_through
    resources :messages
    resources :users, :only => [:show, :update]
    get ":username", to: "users#show"
  end





  root 'ensemble#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
