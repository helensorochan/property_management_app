Rails.application.routes.draw do
  devise_for :users
  root to: 'developers#index'

  resources :developers, only: [:show, :index] do
    resources :building_complexes do
      resources :properties
    end
  end
end
