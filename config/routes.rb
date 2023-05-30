Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
  end
end
