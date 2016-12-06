Rails.application.routes.draw do

  get 'tracks/upload'

  get 'tracks/delete'

  resources :projects do
    resources :tracks
  end

  root 'ensemble#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
